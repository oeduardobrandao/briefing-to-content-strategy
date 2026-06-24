#!/usr/bin/env bash
#
# Instalador da skill "briefing-to-content-strategy".
# Detecta os agentes de IA instalados na máquina e copia a skill para cada um.
# Markdown puro — não precisa de Node nem de nenhuma dependência. Seguro re-rodar.
#
#   curl -fsSL https://raw.githubusercontent.com/oeduardobrandao/briefing-to-content-strategy/main/install.sh | bash
#
set -euo pipefail

# ----- Configuração (ajuste oeduardobrandao após criar o repositório) -----
REPO="${SKILL_REPO:-oeduardobrandao/briefing-to-content-strategy}"
BRANCH="${SKILL_BRANCH:-main}"
SKILL_NAME="briefing-to-content-strategy"
# --------------------------------------------------------------------

say()  { printf "  %s\n" "$1"; }
ok()   { printf "  \033[32m✓\033[0m %s\n" "$1"; }
skip() { printf "  \033[2m–\033[0m %s\n" "$1"; }

echo ""
echo "Instalando a skill: $SKILL_NAME"
echo ""

# 1) Baixa a skill (tarball do repositório) para uma pasta temporária
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
URL="https://codeload.github.com/${REPO}/tar.gz/refs/heads/${BRANCH}"
say "Baixando de github.com/${REPO} (${BRANCH})…"
curl -fsSL "$URL" | tar -xz -C "$TMP"
SRC_ROOT="$(find "$TMP" -maxdepth 1 -type d -name '*-'"${BRANCH}" | head -1)"
[ -z "$SRC_ROOT" ] && SRC_ROOT="$(find "$TMP" -maxdepth 1 -mindepth 1 -type d | head -1)"

# Monta a pasta da skill (SKILL.md + references) num staging limpo
STAGE="$TMP/$SKILL_NAME"
mkdir -p "$STAGE"
cp "$SRC_ROOT/SKILL.md" "$STAGE/"
[ -d "$SRC_ROOT/references" ] && cp -R "$SRC_ROOT/references" "$STAGE/"

if [ ! -f "$STAGE/SKILL.md" ]; then
  echo "  Erro: SKILL.md não encontrado no repositório." >&2
  exit 1
fi

# 2) Detecta agentes (instala só onde o agente existe) e copia a skill
#    base do agente -> subpasta de skills
declare -a AGENTS=(
  "$HOME/.claude:Claude Code / Desktop"
  "$HOME/.codex:OpenAI Codex"
  "$HOME/.openclaw:OpenClaw"
)

installed=0
install_into() {  # $1 = dir de skills destino, $2 = rótulo
  local dest="$1" label="$2"
  mkdir -p "$dest/$SKILL_NAME"
  rm -rf "${dest:?}/$SKILL_NAME"
  cp -R "$STAGE" "$dest/$SKILL_NAME"
  ok "$label  →  $dest/$SKILL_NAME"
  installed=$((installed+1))
}

for entry in "${AGENTS[@]}"; do
  base="${entry%%:*}"; label="${entry#*:}"
  if [ -d "$base" ]; then
    install_into "$base/skills" "$label"
  else
    skip "$label (não encontrado)"
  fi
done

# Agentes baseados em projeto (só se estiver dentro de um projeto que os usa)
[ -d ".cursor" ] && install_into ".cursor/skills" "Cursor (projeto atual)"
[ -d ".gemini" ] && install_into ".gemini/skills" "Gemini CLI (projeto atual)"

# Fallback: nenhum agente detectado → instala no padrão ~/.claude/skills
if [ "$installed" -eq 0 ]; then
  say "Nenhum agente detectado; instalando no padrão ~/.claude/skills"
  install_into "$HOME/.claude/skills" "Claude Code / Desktop (padrão)"
fi

echo ""
echo "Pronto. Reinicie a sessão do seu agente para a skill ser carregada."
echo "App web (claude.ai): suba o arquivo .skill em Configurações > Features."
echo ""

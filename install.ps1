<#
  Instalador da skill "briefing-to-content-strategy" (Windows PowerShell 5.1+).
  Detecta os agentes instalados e copia a skill para cada um. Seguro re-rodar.

    irm https://raw.githubusercontent.com/oeduardobrandao/briefing-to-content-strategy/main/install.ps1 | iex
#>

$ErrorActionPreference = "Stop"

# ----- Configuração (ajuste oeduardobrandao após criar o repositório) -----
$Repo      = if ($env:SKILL_REPO)   { $env:SKILL_REPO }   else { "oeduardobrandao/briefing-to-content-strategy" }
$Branch    = if ($env:SKILL_BRANCH) { $env:SKILL_BRANCH } else { "main" }
$SkillName = "briefing-to-content-strategy"
# --------------------------------------------------------------------

Write-Host ""
Write-Host "Instalando a skill: $SkillName"
Write-Host ""

$tmp = Join-Path $env:TEMP ("skill-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tmp | Out-Null
try {
  $zip = Join-Path $tmp "skill.zip"
  $url = "https://codeload.github.com/$Repo/zip/refs/heads/$Branch"
  Write-Host "  Baixando de github.com/$Repo ($Branch)..."
  Invoke-WebRequest -Uri $url -OutFile $zip
  Expand-Archive -Path $zip -DestinationPath $tmp -Force
  $srcRoot = Get-ChildItem -Path $tmp -Directory | Where-Object { $_.Name -like "*-$Branch" } | Select-Object -First 1
  if (-not $srcRoot) { $srcRoot = Get-ChildItem -Path $tmp -Directory | Select-Object -First 1 }

  $stage = Join-Path $tmp $SkillName
  New-Item -ItemType Directory -Path $stage | Out-Null
  Copy-Item (Join-Path $srcRoot.FullName "SKILL.md") $stage
  $refs = Join-Path $srcRoot.FullName "references"
  if (Test-Path $refs) { Copy-Item $refs $stage -Recurse }

  if (-not (Test-Path (Join-Path $stage "SKILL.md"))) { throw "SKILL.md nao encontrado no repositorio." }

  $agents = @(
    @{ Base = (Join-Path $HOME ".claude");   Label = "Claude Code / Desktop" },
    @{ Base = (Join-Path $HOME ".codex");    Label = "OpenAI Codex" },
    @{ Base = (Join-Path $HOME ".openclaw"); Label = "OpenClaw" }
  )

  $installed = 0
  function Install-Into($dest, $label) {
    $target = Join-Path $dest $SkillName
    if (Test-Path $target) { Remove-Item $target -Recurse -Force }
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    Copy-Item $stage $target -Recurse
    Write-Host "  [ok] $label  ->  $target"
    $script:installed++
  }

  foreach ($a in $agents) {
    if (Test-Path $a.Base) { Install-Into (Join-Path $a.Base "skills") $a.Label }
    else { Write-Host "  [--] $($a.Label) (nao encontrado)" }
  }
  if (Test-Path ".cursor") { Install-Into (Join-Path ".cursor" "skills") "Cursor (projeto atual)" }
  if (Test-Path ".gemini") { Install-Into (Join-Path ".gemini" "skills") "Gemini CLI (projeto atual)" }

  if ($installed -eq 0) {
    Write-Host "  Nenhum agente detectado; instalando no padrao ~/.claude/skills"
    Install-Into (Join-Path (Join-Path $HOME ".claude") "skills") "Claude Code / Desktop (padrao)"
  }

  Write-Host ""
  Write-Host "Pronto. Reinicie a sessao do seu agente para a skill ser carregada."
  Write-Host "App web (claude.ai): suba o arquivo .skill em Configuracoes > Features."
  Write-Host ""
}
finally {
  Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
}

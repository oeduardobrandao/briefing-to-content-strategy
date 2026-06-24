# Briefing → Estratégia de Conteúdo

Uma [Agent Skill](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview) que transforma o **briefing** de um profissional de saúde em uma **Estratégia de Conteúdo** completa para Instagram, entregando dois artefatos: a estratégia em **Markdown** e um **deck `.pptx`** com a identidade visual da marca.

Feita no padrão metodológico da **DK Marketing Médico**.

## O que ela faz

A partir de um briefing (respostas do cliente sobre negócio, público, história pessoal, tom de voz), a skill **destila um posicionamento** — não resume o briefing, e sim pesca o que vira diferencial competitivo — e monta a estratégia seguindo um template canônico:

`Objetivo → Objetivos de comunicação → Benchmarking → Percepção do paciente → Público → Condições clínicas → 4 Pilares de conteúdo → Formatos → Ganchos criativos → Distribuição mensal → Tom de voz → O que não fazer`

O destaque da metodologia são os **ganchos criativos**: a história de vida e os hobbies do profissional viram ideias de conteúdo, pela lógica `Universo da pessoa → fato inesperado → conexão com a condição → CTA`.

## Estrutura

```
.
├── SKILL.md                          # fluxo, template canônico e regras de qualidade
└── references/
    ├── transformation-guide.md       # mapa: campo do briefing → seção da estratégia
    └── examples.md                   # dois exemplos completos (personas fictícias)
```

## Instalação

Uma linha. Detecta os agentes instalados e instala em cada um. Sem dependências (a skill é markdown puro). Seguro re-rodar.

```bash
# macOS / Linux / WSL / Git Bash
curl -fsSL https://raw.githubusercontent.com/oeduardobrandao/briefing-to-content-strategy/main/install.sh | bash

# Windows (PowerShell 5.1+)
irm https://raw.githubusercontent.com/oeduardobrandao/briefing-to-content-strategy/main/install.ps1 | iex
```

Instala em `~/.claude/skills/` (Claude Code / Desktop) e em outros agentes compatíveis que existirem na máquina (Codex, OpenClaw; Cursor/Gemini no projeto atual). Pula os que você não tiver. Depois, reinicie a sessão do agente.

**Prefere inspecionar antes de rodar?** (boa prática para qualquer `curl | bash`)

```bash
curl -fsSL https://raw.githubusercontent.com/oeduardobrandao/briefing-to-content-strategy/main/install.sh -o install.sh
less install.sh   # leia o que ele faz
bash install.sh
```

**Instalação manual / app web:** o instalador acima vale para agentes de terminal. No **app web (claude.ai)**, suba o arquivo `.skill` (da página de [Releases](../../releases)) em **Configurações > Features**. Ou clone o repositório e copie a pasta da skill para `~/.claude/skills/`:

```bash
git clone https://github.com/oeduardobrandao/briefing-to-content-strategy.git
cp -r briefing-to-content-strategy ~/.claude/skills/briefing-to-content-strategy
```

## Uso

Com a skill instalada, peça em linguagem natural, por exemplo:

> "Crie a estratégia de conteúdo da [cliente]."
> "Transforme este briefing em uma estratégia de conteúdo." (colando o briefing)

A skill tenta puxar o briefing de um sistema conectado (ex.: um connector de gestão de clientes) e, se não houver, aceita o briefing colado. A seção de **Benchmarking** é preenchida com pesquisa de perfis reais na web.

## Privacidade

Os exemplos em `references/examples.md` usam **personas fictícias**. Nenhum dado real de cliente é distribuído neste repositório. Ao usar a skill, trate os briefings e estratégias gerados como material confidencial dos seus clientes.

## Licença

[MIT](LICENSE) © 2026 DK Marketing Médico. Ajuste o titular conforme necessário.

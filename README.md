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

**Como pacote `.skill`:** baixe/gere o arquivo `.skill` (veja abaixo) e instale-o no seu ambiente Claude conforme a documentação de Agent Skills.

**Direto do repositório:** clone e aponte seu ambiente para a pasta da skill.

```bash
git clone https://github.com/<seu-usuario>/briefing-to-content-strategy.git
```

Para empacotar como `.skill`, use o packager do [skill-creator](https://github.com/anthropics/skills) da Anthropic:

```bash
python -m scripts.package_skill caminho/para/briefing-to-content-strategy
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

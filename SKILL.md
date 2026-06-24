---
name: briefing-to-content-strategy
description: >-
  Transforma o briefing de um cliente em uma Estratégia de Conteúdo completa para
  Instagram, no padrão metodológico da DK Marketing Médico. Use esta skill SEMPRE que
  o usuário pedir para "criar/gerar/montar uma estratégia de conteúdo", "transformar um
  briefing em estratégia", "fazer a estratégia do(a) [nome do cliente]", ou mencionar
  briefing + estratégia juntos — mesmo que não diga a palavra "skill". Funciona puxando
  o briefing de um sistema de gestão de clientes conectado, ou com um briefing
  colado/anexado. Entrega DOIS artefatos: a estratégia em texto (Markdown) e um deck
  .pptx pronto, com as cores e tipografia da marca do cliente.
---

# Briefing → Estratégia de Conteúdo

Esta skill pega o **briefing** de um profissional (tipicamente um médico ou dentista) e
o transforma em uma **Estratégia de Conteúdo** para Instagram, seguindo um template
canônico. A saída são dois artefatos: a estratégia em **Markdown** e um **deck `.pptx`**
com a identidade visual da marca.

O objetivo não é resumir o briefing — é **destilá-lo em posicionamento**. A maior
parte do valor está em pescar, no meio das respostas longas e pessoais do briefing,
o que vira diferencial competitivo: a história única da pessoa, seus hobbies e
universos pessoais (que viram ganchos criativos), suas dores de público e seu jeito
de falar.

## Fluxo de trabalho

1. **Obter o briefing.** Primeiro tente o sistema de gestão de clientes conectado; se
   não houver, aceite o briefing colado/anexado pelo usuário. Veja "Fontes do briefing".
2. **Mapear briefing → seções.** Use `references/transformation-guide.md` para saber
   qual campo do briefing alimenta cada seção da estratégia. Leia esse arquivo antes
   de escrever.
3. **Pesquisar o benchmarking.** Use a busca na web para achar concorrentes e
   referências reais (com @ verificado) da especialidade. Veja "Pesquisa de benchmarking".
4. **Escrever a estratégia em Markdown** seguindo o template canônico (abaixo). Salve
   em `Estrategia_Conteudo_<Nome>.md` no diretório de saída do seu ambiente.
5. **Gerar o deck `.pptx`.** Leia o guia de criação de `.pptx` do seu ambiente ANTES de
   criar o arquivo. Use as cores/fontes da marca (veja "Identidade visual"). Salve em
   `Estrategia_Conteudo_<Nome>.pptx`.
6. **Apresentar os dois arquivos** e um resumo curto do posicionamento escolhido.

Em caso de dúvida, consulte os dois exemplos completos em `references/examples.md`
(personas fictícias) — são briefing → estratégia ponta a ponta.

## Fontes do briefing

**Sistema de gestão de clientes (preferencial).** Se o usuário citar um cliente por
nome, resolva o nome → identificador do cliente, puxe o briefing (respostas) e o perfil
de marca (cores/fontes). Se já existir uma "Estratégia de Conteúdo" para o cliente,
avise o usuário e pergunte se ele quer **refazer** ou usar como base, em vez de
sobrescrever às cegas. Verifique também o repositório de arquivos do cliente (ex.:
Google Drive): a estratégia pode estar lá, e não no sistema de gestão.

**Briefing colado/anexado (fallback).** Se não houver sistema conectado, trabalhe com o
texto que o usuário fornecer. O briefing costuma vir em seções como "Briefing", "Manual
de Marca" e "Design". Se faltar algo essencial (especialidade, público, história
pessoal, tom de voz), pergunte de forma objetiva antes de inventar.

> A skill **gera os arquivos**; ela não grava a estratégia de volta no sistema de
> gestão. Avise o usuário que ele cola/sobe o resultado lá.

## Template canônico (siga fielmente)

Use EXATAMENTE estas seções, nesta ordem. Títulos em caixa-alta como no original.
Escreva tudo em português, em primeira ou terceira pessoa de forma consistente (frases
diretas, sem encher linguiça).

```
# Estratégia de Conteúdo – [Nome] | [Especialidade]

OBJETIVO
[1 parágrafo. Consolidar a marca pessoal como referência em [especialidade] em
[cidade], unindo competência técnica, humanização e autenticidade. O posicionamento
central da pessoa em uma frase.]

OBJETIVOS DE COMUNICAÇÃO
[3 a 4 objetivos, no formato "Título → explicação curta". Tirados dos objetivos de
negócio do briefing. Quase sempre inclui: aumentar agendamentos; mostrar a pessoa
real por trás do jaleco; autoridade humana/sem arrogância.]

BENCHMARKING (pesquisa de mercado)
[Concorrentes diretos (mesma especialidade na cidade), indiretos (especialidade
vizinha) e referências nacionais. Cada referência com @ REAL e o aprendizado dela.
Pesquise os perfis na web — veja "Pesquisa de benchmarking" abaixo. Inclua também
Oportunidades (o gap que o cliente ocupa) e, quando fizer sentido, Tendências do setor.]

PERCEPÇÃO DO PACIENTE
[O que o paciente sente hoje (medo, vergonha, desinformação), o que ele valoriza
(tempo, escuta, clareza) e a OPORTUNIDADE: o espaço de mercado que esse cliente pode
ocupar que os concorrentes deixam vago.]

PÚBLICO
Perfil 1 — [apelido do perfil]
[idade/contexto]. Dores: [...]. Desejos: [...].
Perfil 2 — [apelido do perfil]
[idade/contexto]. Dores: [...]. Desejos: [...].

Condições que levam o paciente até [Nome]
[Lista das principais condições/queixas clínicas da especialidade, cada uma com 1
frase explicando a dor real e por que o paciente demora a procurar. 6 a 8 itens.]

OS 4 PILARES
[Os quatro pilares abaixo são um PONTO DE PARTIDA, não regra rígida. Adapte nome,
recorte e ênfase ao nicho e ao briefing: pode renomear ("Educação em saúde" → "Boca &
Corpo"), recombinar, ou trocar um deles por outro que sirva melhor ao posicionamento
(ex.: "Quebra de objeção", "Autoridade Peri + Implante"). Mantenha tipicamente 4
pilares — é o que dá ritmo à distribuição mensal — com 3 exemplos de título cada.]
1. Educação em saúde — explicar, traduzir e desmistificar.
   Exemplos: [3 títulos de post no tom da pessoa]
2. Comunidade e humanização — mostrar a pessoa real, com leveza.
   Exemplos: [3 títulos que usam a história/hobbies do briefing]
3. Autoridade e profissão — ética, técnica e diferencial, sem soar arrogante.
   Exemplos: [3 títulos]
4. Engajamento e inspiração — tocar o emocional e gerar compartilhamento.
   Exemplos: [3 títulos]

FORMATOS
Reels → atração e alcance. [...]
Carrosséis → educação e conversão. [...]
Stories → proximidade e venda. [...]

ESTRATÉGIA DE COMUNICAÇÃO — GANCHOS CRIATIVOS
[A parte mais diferenciada. Lógica fixa de cada gancho:
Universo da pessoa → fato histórico/pessoal inesperado → conexão com a condição → CTA.
Crie 3 a 4 ganchos usando os hobbies, a história de vida e as paixões do briefing.
Cada gancho: título, o "roteiro" em itálico, a condição que ele puxa e um CTA.]

DISTRIBUIÇÃO MENSAL
6 conteúdos de atração — [...]
4 conteúdos educativos — [...]
2 conteúdos de venda — [...]

TOM DE VOZ
[Descrição em 1-2 frases + a mensagem central entre aspas. Tirado do "tom de voz",
palavras-chave e emojis do briefing.]

O QUE NÃO FAZER
[Lista de proibições, tirada de "o que te faz dar unfollow", "o que você não aborda",
"evitar" do briefing. Ex.: nada de promessa milagrosa, nada de conteúdo genérico que
qualquer médico assinaria, nada de jargão sem explicação.]
```

### Pesquisa de benchmarking (sempre com @ reais)

O Benchmarking é uma seção padrão da estratégia e deve trazer **perfis reais**, não
placeholders. Antes de escrever essa seção, **pesquise na web**:
- Concorrentes diretos: "[especialidade] Instagram [cidade]". Procure 2-3 perfis ativos.
- Referências nacionais: perfis grandes e didáticos da mesma especialidade no Brasil.
- Para cada perfil, registre o **@ real** e **o que aprender com ele** (formato,
  frequência, tom, o que performa). Confirme o @ na busca; **nunca invente handle**.
  Se não achar perfil bom para um item, diga isso em vez de fabricar.

Feche o Benchmarking com **Oportunidades** (o gap que o cliente ocupa em relação ao que
os concorrentes fazem mal — frio demais, técnico, ausente) e, quando agregar,
**Tendências do setor** (ex.: vídeos curtos, storytelling, indicação digital).

## Princípios de qualidade (o que separa uma boa estratégia de um resumo)

- **Ganchos saem da vida real.** O briefing está cheio de matéria-prima pessoal —
  hobbies, lições marcantes, tradições de família, gostos culturais, a razão de ter
  escolhido a especialidade. É daí que saem os ganchos criativos e o pilar de
  humanização. Se a pessoa conviveu com uma condição crônica, isso vira gancho. Se um
  acontecimento de família a levou à profissão, vira conteúdo. Procure ativamente esses
  fatos.
- **Posicionamento por contraste.** Sempre defina a OPORTUNIDADE em relação ao que os
  concorrentes fazem de errado (técnico demais, frio, ausente). O cliente ocupa o
  espaço vago.
- **Tom espelha a pessoa.** Use as palavras-chave, expressões e emojis que o próprio
  briefing lista. Respeite o que a pessoa pediu para evitar.
- **Títulos concretos, não temas vagos.** "Colonoscopia dói? A verdade que ninguém te
  conta" é título. "Falar sobre exames" não é.
- **Coerência com o manual de marca.** Vocabulário (ex.: "paciente", nunca "cliente"),
  valores e estética devem bater com o manual, se houver.

## Identidade visual (para o deck)

Puxe do perfil de marca a paleta e a tipografia e use-as no `.pptx`. Quando não houver
identidade definida, use uma base clean (fundo claro, um tom de destaque, tipografia
serifada elegante para títulos + sans legível para corpo) e sinalize ao usuário que
adotou um padrão provisório.

Exemplo ilustrativo de paleta clean: um tom escuro de marca (ex.: verde profundo),
um claro de fundo (areia/off-white), um acento quente (terracota) e um secundário
(sálvia). Títulos serifados, corpo em sans.

O deck cobre uma seção por slide (capa → objetivo → objetivos de comunicação →
benchmarking → percepção → público → condições → 4 pilares → formatos → ganchos →
distribuição → tom de voz → o que não fazer). Antes de gerá-lo, **leia o guia de
criação de `.pptx` do seu ambiente**.

## Arquivos de referência

- `references/transformation-guide.md` — mapa campo do briefing → seção da estratégia.
  **Leia antes de escrever.**
- `references/examples.md` — dois exemplos completos com personas fictícias: briefing de
  entrada e estratégia de saída. Consulte para calibrar tom e profundidade.

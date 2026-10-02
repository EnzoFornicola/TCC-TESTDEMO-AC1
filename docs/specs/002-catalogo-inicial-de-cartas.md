# Spec 002 — Catálogo Inicial de Cartas

## Escopo

Este catálogo define 20 cartas para o primeiro protótipo, distribuídas em
quatro eras temáticas. Cada era possui cinco cartas: uma combinação de figuras
históricas ou simbólicas e personagens mitológicos associados ao período.

As cartas usam os seguintes valores iniciais:

- **Vida:** pontos de vida máximos.
- **Defesa:** reduz diretamente o dano recebido.
- **Ataque:** dano bruto causado antes da defesa do alvo.
- **Custo:** energia gasta para usar o ataque ou a habilidade ativa.
- **Papel:** função principal na formação.

## Regras de uso

- O jogador escolhe até quatro cartas antes da batalha.
- As cartas escolhidas são as únicas usadas durante o duelo, salvo efeitos de
  ressurreição.
- O dano recebido segue a fórmula: `máximo(0, dano do ataque - defesa)`. 
- As habilidades ativas pagam o custo indicado em energia.
- As passivas ficam disponíveis conforme descrito em cada carta.
- Os números são valores provisórios para o protótipo.

## Era Medieval

### MED-001 — Cavaleiro Guardião

**Papel:** tanque
**Vida:** 100
**Defesa:** 10
**Ataque:** 10
**Custo:** 10

**Passiva — Muralha:** enquanto estiver na frente, reduz em 5 o dano recebido
  por uma carta de suporte posicionada atrás dele.

**Ativa — Provocar:** custa 25 de energia. Até o próximo turno, o inimigo deve
  priorizar o Cavaleiro Guardião quando houver uma ação válida contra ele.

### MED-002 — Joana d'Arc

**Papel:** suporte e fortalecimento
**Vida:** 50
**Defesa:** 5
**Ataque:** 10
**Custo:** 10

**Passiva — Estandarte:** cartas aliadas adjacentes recebem +5 de ataque.

**Ativa — Inspiração:** custa 25 de energia. Uma carta aliada recebe +10 de
  ataque por 2 turnos.

### MED-003 — Robin Hood

**Papel:** dano à distância
**Vida:** 50
**Defesa:** 5
**Ataque:** 20
**Custo:** 10

**Passiva — Tiro Preciso:** ignora 2 pontos de defesa do alvo.

**Ativa — Flecha Perfurante:** custa 25 de energia e causa 30 de dano antes da
  defesa do alvo.

### MED-004 — Merlin

**Papel:** controle e preparação
**Vida:** 50
**Defesa:** 5
**Ataque:** 10
**Custo:** 10

**Passiva — Oráculo:** no início do turno, revela o próximo efeito relevante do
  inimigo e aumenta em 5 a regeneração de energia do jogador naquele turno.

**Ativa — Encantamento:** custa 40 de energia. A próxima habilidade inimiga
  custa 20 de energia adicional.

### MED-005 — Dragão do Castelo

**Papel:** dano pesado
**Vida:** 100
**Defesa:** 10
**Ataque:** 30
**Custo:** 25

**Passiva — Escamas Antigas:** a primeira vez que receber dano em cada turno,
  reduz esse dano em 5.

**Ativa — Sopro de Fogo:** custa 50 de energia e causa 60 de dano antes da
  defesa do alvo.

## Era Grega e Mitológica

### GRE-001 — Atena

**Papel:** defesa e planejamento
**Vida:** 100
**Defesa:** 10
**Ataque:** 10
**Custo:** 10

**Passiva — Estratégia:** uma vez por turno, a primeira carta aliada que
  receber dano ganha 5 de defesa até o próximo turno.

**Ativa — Égide:** custa 25 de energia. Concede 20 de defesa a uma carta por 1
  turno.

### GRE-002 — Aquiles

**Papel:** dano de alto risco
**Vida:** 50
**Defesa:** 5
**Ataque:** 30
**Custo:** 25

**Passiva — Calcanhar:** possui 1 ponto de vida enquanto mantém seu ataque
  máximo; recebe +10 de ataque enquanto estiver abaixo de 25% da vida máxima.

**Ativa — Investida:** custa 40 de energia e causa 55 de dano antes da defesa,
  mas Aquiles recebe 10 de dano depois do ataque.

### GRE-003 — Medusa

**Papel:** controle
**Vida:** 50
**Defesa:** 5
**Ataque:** 15
**Custo:** 10

**Passiva — Petrificar:** a primeira carta inimiga atingida em cada turno não
  pode ser reorganizada na preparação do turno seguinte.

**Ativa — Olhar da Górgona:** custa 40 de energia. Impede uma carta inimiga de
  atacar no próximo turno.

### GRE-004 — Hércules

**Papel:** tanque ofensivo
**Vida:** 100
**Defesa:** 10
**Ataque:** 25
**Custo:** 25

**Passiva — Doze Trabalhos:** recebe 5 de defesa adicional quando estiver com
  menos de metade da vida.

**Ativa — Golpe do Leão:** custa 50 de energia e causa 50 de dano antes da
  defesa do alvo.

### GRE-005 — Oráculo de Delfos

**Papel:** suporte e manipulação de energia
**Vida:** 50
**Defesa:** 5
**Ataque:** 5
**Custo:** 10

**Passiva — Presságio:** no início do turno, o jogador pode escolher entre
  recuperar 5 de energia ou dar 5 de energia ao limite temporário de uma carta.

**Ativa — Destino Adiado:** custa 25 de energia. Uma carta aliada derrotada
  neste turno pode ser ressuscitada no próximo turno com 1 de vida.

## Era Nórdica

### NOR-001 — Thor

**Papel:** dano em área
**Vida:** 100
**Defesa:** 10
**Ataque:** 25
**Custo:** 25

**Passiva — Trovão:** quando derrota uma carta, causa 10 de dano a outra carta
  inimiga antes da defesa.

**Ativa — Mjölnir:** custa 50 de energia e causa 45 de dano a duas cartas
  inimigas, aplicando a defesa de cada alvo separadamente.

### NOR-002 — Freyja

**Papel:** suporte e ressurreição
**Vida:** 50
**Defesa:** 5
**Ataque:** 10
**Custo:** 10

**Passiva — Seiðr:** habilidades de ressurreição usadas por aliados custam 5 de
  energia a menos.

**Ativa — Retorno de Fólkvangr:** custa 50 de energia. Ressuscita uma carta
  derrotada no mesmo espaço com vida cheia, sem aplicar buffs.

### NOR-003 — Loki

**Papel:** controle e risco
**Vida:** 50
**Defesa:** 5
**Ataque:** 15
**Custo:** 10

**Passiva — Trapaça:** uma vez por turno, pode reduzir em 10 o custo da próxima
  habilidade, mas a habilidade seguinte causa 5 de dano a Loki.

**Ativa — Ilusão:** custa 25 de energia. Troca a posição de duas cartas inimigas
  na preparação do próximo turno.

### NOR-004 — Odin

**Papel:** estratégia e sacrifício por combate
**Vida:** 100
**Defesa:** 5
**Ataque:** 20
**Custo:** 25

**Passiva — Sacrifício Planejado:** quando uma carta aliada é derrotada em
  combate, Odin concede 10 de energia ao jogador no próximo turno.

**Ativa — Conhecimento das Runas:** custa 40 de energia. A próxima habilidade
  de uma carta aliada recebe um efeito adicional definido pela carta.

### NOR-005 — Valquíria

**Papel:** ressurreição fraca e recuperação
**Vida:** 50
**Defesa:** 5
**Ataque:** 15
**Custo:** 10

**Passiva — Escolha dos Caídos:** quando uma carta aliada é derrotada, a
  Valquíria recebe +5 de defesa até o fim da batalha.

**Ativa — Convocar aos Mortos:** custa 25 de energia. Ressuscita uma carta
  derrotada no mesmo espaço com 1 ponto de vida.

## Era Egípcia

### EGI-001 — Anúbis

**Papel:** ressurreição e controle do risco
**Vida:** 100
**Defesa:** 10
**Ataque:** 15
**Custo:** 25

**Passiva — Balança dos Mortos:** cartas aliadas ressuscitadas retornam com +5
  de defesa até o fim do turno.

**Ativa — Julgamento:** custa 40 de energia. Ressuscita uma carta derrotada no
  mesmo espaço com 25% da vida máxima.

### EGI-002 — Cleópatra

**Papel:** suporte e economia
**Vida:** 50
**Defesa:** 5
**Ataque:** 10
**Custo:** 10

**Passiva — Diplomacia:** a primeira habilidade de suporte usada em cada turno
  custa 5 de energia a menos.

**Ativa — Aliança:** custa 25 de energia. Uma carta aliada recebe +10 de defesa
  e +10 de ataque por 1 turno.

### EGI-003 — Ramsés II

**Papel:** tanque
**Vida:** 100
**Defesa:** 10
**Ataque:** 15
**Custo:** 10

**Passiva — Faraó:** enquanto estiver na frente, não pode ser reorganizado pelo
  inimigo.

**Ativa — Exército do Faraó:** custa 40 de energia. Concede 10 de defesa a
  todas as cartas aliadas por 1 turno.

### EGI-004 — Ísis

**Papel:** cura e suporte
**Vida:** 50
**Defesa:** 5
**Ataque:** 5
**Custo:** 10

**Passiva — Maternidade:** quando uma carta aliada fica abaixo de 25% da vida,
  recupera 5 pontos de vida uma vez por batalha.

**Ativa — Cura Divina:** custa 25 de energia. Recupera 20 pontos de vida de uma
  carta ativa.

### EGI-005 — Esfinge

**Papel:** controle e defesa extrema
**Vida:** 1
**Defesa:** 75
**Ataque:** 10
**Custo:** 25

**Passiva — Enigma:** a primeira vez que receber dano em cada turno, reduz o
  dano recebido em 10 adicionais.

**Ativa — Pergunta Impossível:** custa 40 de energia. A carta inimiga escolhida
  não pode usar habilidades ativas no próximo turno.

## Critérios de aceitação do catálogo

- Dado que o catálogo é carregado, quando as cartas são listadas, então existem
  20 cartas distribuídas em 4 eras com 5 cartas por era.
- Dado que uma carta é selecionada para uma formação, quando seus dados são
  exibidos, então vida, defesa, ataque, custos, passiva e ativa estão definidos.
- Dado que duas cartas de uma mesma era são comparadas, quando seus papéis são
  avaliados, então elas podem cumprir funções diferentes na formação.
- Dado que o jogador monta uma formação de quatro cartas, quando combina
  tanques, suportes, dano ou ressurreição, então a combinação produz um
  playstyle identificável.

## Perguntas em aberto

- Os nomes e figuras históricas ou mitológicas serão mantidos ou substituídos
  por personagens originais para evitar dependência de referências específicas?
- Como elementos interagem com ataques e passivas sem criar dependências
  obrigatórias?
- Os valores de vida, defesa, ataque e custo precisam ser recalibrados após o
  primeiro playtest.
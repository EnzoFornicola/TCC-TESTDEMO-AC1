# Spec 001 — Sistema de Batalha e Energia

## Fora do escopo

- Controle direto de um personagem — o jogador participa como duelista por
  meio das cartas, do deck e das decisões do duelo.
- Substituição normal de uma carta derrotada durante a batalha — o espaço fica
  vazio, salvo quando uma habilidade permitir cura ou ressurreição.
- Dependência obrigatória entre elementos, personagens e cartas para liberar
  uma jogada — a energia deve ser o recurso principal de limitação.

## Requisitos

### RF-AGE-001 — Formação inicial do duelo

**Prioridade:** DEVE
**Status:** CONFIRMADO

Cada duelista inicia a batalha com até quatro cartas previamente escolhidas em
campo.

**Critérios de aceitação**

- Dado que uma batalha começou, quando a formação é apresentada, então o
  jogador possui no máximo quatro cartas escolhidas previamente em campo.

**Origem:** o grupo quer que a estratégia comece na construção da formação e
  que o jogador se sinta diretamente como o duelista.

### RF-AGE-007 — Formação fixa durante o duelo

**Prioridade:** DEVE
**Status:** CONFIRMADO
**Depende de:** RF-AGE-001

As quatro cartas escolhidas para a formação são as únicas cartas usadas durante
o duelo. O jogador e o inimigo não compram nem adicionam novas cartas durante a
batalha e podem trocar ou ajustar cartas somente fora dela.

**Critérios de aceitação**

- Dado que o duelo começou, quando uma carta da formação é derrotada, então o
  jogador não pode substituí-la por outra carta fora das regras de
  ressurreição.
- Dado que o duelo começou, quando o jogador ou o inimigo tenta adicionar uma
  carta fora da formação, então a ação não é permitida.
- Dado que o jogador está entre batalhas, quando acessa a etapa de preparação,
  então pode trocar ou ajustar as cartas da próxima formação.

**Origem:** o grupo quer que as quatro cartas escolhidas definam a estratégia
  de cada duelo, enquanto as mudanças de deck acontecem na preparação entre
  batalhas.

### RF-AGE-008 — Vida, defesa e derrota das cartas

**Prioridade:** DEVE
**Status:** CONFIRMADO

Cada carta possui pontos de vida e defesa próprios. Ataques causam dano às
cartas adversárias, e uma carta é derrotada quando não consegue mais
permanecer em campo.

O dano recebido é calculado subtraindo a defesa do alvo do dano do ataque. O
resultado não pode ser menor que zero.

**Critérios de aceitação**

- Dado que uma carta está em campo, quando seus atributos são consultados,
  então seus pontos de vida e sua defesa estão definidos.
- Dado que um ataque válido atinge uma carta, quando o efeito do ataque é
  resolvido, então a carta sofre dano conforme a regra de combate.
- Dado que um ataque causa 20 de dano contra uma carta com 5 de defesa, quando
  o dano é resolvido, então a carta perde 15 pontos de vida.
- Dado que a defesa de uma carta é igual ou maior que o dano do ataque, quando
  o dano é resolvido, então a carta não perde pontos de vida.
- Dado que uma carta não consegue mais permanecer em campo, quando a derrota é
  resolvida, então ela deixa seu espaço vazio, salvo efeito de cura ou
  ressurreição permitido pela carta.
- Dado que uma carta é derrotada, quando seu estado é apresentado durante o
  restante da batalha, então ela aparece inativa ou acinzentada e não pode ser
  usada, salvo se uma habilidade válida a ressuscitar.

**Origem:** o grupo definiu vida, defesa e dano como a base necessária para que
  as cartas possam atacar, resistir e ser derrotadas durante o duelo. A
  subtração direta torna a defesa fácil de entender e verificar.

### RF-AGE-009 — Perfis de atributos e raridade

**Prioridade:** DEVE
**Status:** PROVISÓRIO

As cartas usam perfis variados de vida e defesa. Como referência inicial, uma
carta comum possui 50 pontos de vida e 5 de defesa, enquanto uma carta normal
ou incomum possui 100 pontos de vida e 10 de defesa. Cartas específicas podem
trocar vida por defesa ou concentrar seus atributos em um único valor.

**Critérios de aceitação**

- Dado que uma carta comum é criada no protótipo, quando seus atributos são
  consultados, então ela possui 50 pontos de vida e 5 de defesa, salvo uma
  regra específica da carta.
- Dado que uma carta normal ou incomum é criada no protótipo, quando seus
  atributos são consultados, então ela usa 100 pontos de vida e 10 de defesa
  como referência inicial.
- Dado que uma carta possui um perfil especializado, quando seus atributos
  são consultados, então vida e defesa podem se afastar dessas referências,
  desde que a combinação esteja descrita na carta.
- Dado que duas cartas possuem perfis ou passivas complementares, quando são
  usadas no mesmo deck, então suas características podem contribuir para uma
  estratégia identificável.

**Origem:** o grupo quer que cartas comuns sejam menos fortes por terem menor
  valor, mas que personagens especializados, como uma carta com 1 de vida e 75
  de defesa ou outra com muita vida e pouca defesa, criem variedade natural de
  sinergias e de construção de decks.

**Hipótese de protótipo**

- **Valor inicial:** comum 50/5; normal ou incomum 100/10; perfis
  especializados definidos individualmente
- **Pergunta do protótipo:** os perfis diferentes criam escolhas reais de
  construção sem fazer uma raridade ou atributo dominar todas as estratégias?
- **Teto ou limite de exploração:** testar até quatro perfis especializados e
  manter os valores de referência entre 1 e 100 de vida e entre 1 e 75 de
  defesa nesta rodada.

### RF-AGE-010 — Rotas de aquisição de cartas

**Prioridade:** DEVERIA
**Status:** PROVISÓRIO

O jogador pode obter cartas por boosters, aceitando um resultado incerto com a
possibilidade de encontrar cartas raras, ou comprar diretamente uma carta
específica por um custo maior. A compra direta garante a obtenção da carta
escolhida.

As duas aquisições usam moedas. Skill points não podem ser usados para comprar
boosters ou cartas e ficam reservados para as árvores de upgrades.

**Critérios de aceitação**

- Dado que o jogador abre um booster, quando a recompensa é revelada, então o
  resultado pode conter cartas de raridade diferente.
- Dado que o jogador escolhe uma carta disponível para compra direta, quando
  paga o custo exigido, então recebe exatamente a carta escolhida.
- Dado que uma carta rara é comparada com uma carta comum equivalente, quando
  seus valores e efeitos são avaliados, então a carta rara pode ser mais forte
  conforme sua raridade, sem eliminar a utilidade de sinergias entre cartas.
- Dado que o jogador possui moedas suficientes, quando compra um booster ou uma
  carta diretamente, então as moedas são consumidas conforme o custo da compra.
- Dado que o jogador possui skill points, quando acessa uma compra de booster
  ou carta, então skill points não são aceitos como moeda de compra.

**Origem:** o grupo quer que boosters despertem expectativa pela possibilidade
de obter cartas raras, mas também quer evitar que o jogador dependa apenas de
sorte para conseguir uma carta desejada. A compra direta exige investimento
maior, porém garante o resultado.

**Hipótese de protótipo**

- **Valor inicial:** booster com resultado incerto; compra direta com custo
  maior que o custo esperado de uma tentativa de booster
- **Pergunta do protótipo:** a diferença entre risco e garantia cria decisões
  interessantes sem transformar boosters em uma barreira frustrante?
- **Teto ou limite de exploração:** testar uma rota de booster e uma rota de
  compra direta para um conjunto pequeno de cartas; não definir ainda moeda ou
  preços finais.

### RF-AGE-002 — Turnos alternados

**Prioridade:** DEVE
**Status:** CONFIRMADO

Os duelistas realizam turnos alternados, começando pelo jogador.

**Critérios de aceitação**

- Dado que uma batalha começou, quando o primeiro turno é definido, então o
  jogador realiza a primeira jogada.
- Dado que o jogador terminou seu turno, quando a batalha continua, então o
  inimigo realiza o turno seguinte.

**Origem:** o grupo escolheu uma ordem previsível para que a tomada de decisão
  dependa da estratégia, e não de uma rolagem de iniciativa.

### RF-AGE-014 — Ações livres durante o turno

**Prioridade:** DEVE
**Status:** CONFIRMADO
**Depende de:** RF-AGE-002, RF-AGE-003

Durante seu turno, o jogador pode executar qualquer combinação de cartas,
ataques e habilidades disponíveis, desde que tenha energia suficiente. Pode
guardar energia para turnos posteriores, preparar combos ou gastar toda a
energia antes de encerrar o turno manualmente.

**Critérios de aceitação**

- Dado que o jogador está no próprio turno e possui energia suficiente, quando
  escolhe uma ação válida, então pode executá-la e o custo é descontado.
- Dado que o jogador ainda possui energia e ações válidas disponíveis, quando
  executa uma ação, então pode escolher outra ação no mesmo turno.
- Dado que o jogador quer preparar um combo, quando encerra o turno sem gastar
  toda a energia, então a energia restante é mantida para os turnos seguintes,
  respeitando o limite máximo.
- Dado que o jogador decide terminar sua sequência de ações, quando encerra o
  turno manualmente, então o inimigo recebe o próximo turno.

**Origem:** o grupo quer dar liberdade para guardar energia e preparar combos
  fortes ou gastar tudo de uma vez, fazendo o ritmo do turno depender da
  estratégia do jogador.

### RF-AGE-015 — Turno do inimigo

**Prioridade:** DEVE
**Status:** CONFIRMADO
**Depende de:** RF-AGE-002, RF-AGE-003, RF-AGE-014

Durante o turno do inimigo, ele usa o mesmo sistema de energia e ações do
jogador. Uma inteligência artificial escolhe a combinação de cartas, ataques e
habilidades e encerra o turno quando não houver mais ações válidas ou quando
decidir parar.

**Critérios de aceitação**

- Dado que é o turno do inimigo, quando ele possui energia suficiente e uma
  ação válida, então a IA pode executar essa ação e o custo é descontado.
- Dado que o inimigo possui energia restante e outra ação válida, quando a IA
  continua o turno, então pode executar outra ação antes de encerrá-lo.
- Dado que o inimigo não possui ação válida ou decide encerrar o turno, quando
  o turno termina, então o jogador recebe o próximo turno.
- Dado que uma ação é válida para o jogador e para o inimigo, quando ambos
  tentam executá-la com energia suficiente, então ela segue a mesma regra de
  custo e resolução para os dois lados.

**Origem:** o grupo quer que o inimigo siga as mesmas regras do jogador, mas
  seja controlado por uma IA, evitando vantagens ocultas de sistema.

### RF-AGE-016 — Arquétipos de IA

**Prioridade:** DEVERIA
**Status:** PROVISÓRIO
**Depende de:** RF-AGE-015

Inimigos podem possuir arquétipos de IA diferentes, incluindo estilos
agressivo, defensivo e focado em combos. O arquétipo orienta a seleção de ações
da IA sem alterar as regras de energia ou resolução do duelo.

**Critérios de aceitação**

- Dado que um inimigo possui arquétipo agressivo, quando a IA escolhe entre
  ações válidas, então prioriza causar dano ou derrotar cartas adversárias.
- Dado que um inimigo possui arquétipo defensivo, quando a IA escolhe entre
  ações válidas, então prioriza proteger suas cartas ou recuperar sua
  sobrevivência.
- Dado que um inimigo possui arquétipo focado em combos, quando a IA escolhe
  entre ações válidas, então prioriza preparar e executar combinações de
  cartas ou habilidades.
- Dado que dois inimigos possuem arquétipos diferentes, quando enfrentam uma
  situação equivalente, então podem escolher ações diferentes sem receber
  custos ou recursos exclusivos.

**Origem:** o grupo quer variedade de gameplay como elemento fundamental da
  experiência, fazendo o jogador adaptar o deck e suas decisões a inimigos com
  comportamentos diferentes.

**Hipótese de protótipo**

- **Valor inicial:** três arquétipos: agressivo, defensivo e focado em combos
- **Pergunta do protótipo:** os arquétipos mudam suficientemente a experiência
  sem parecerem previsíveis ou fáceis de explorar?
- **Teto ou limite de exploração:** testar três arquétipos em três encontros,
  sem criar regras exclusivas de energia para nenhum deles.

### RF-AGE-017 — Ressurreição variável

**Prioridade:** DEVERIA
**Status:** PROVISÓRIO

Uma habilidade de ressurreição pode reativar uma carta derrotada e define o
estado em que ela retorna. Habilidades mais caras ou poderosas podem restaurar
a vida cheia e aplicar buffs; habilidades mais fracas podem retornar a carta
com apenas 1 ponto de vida. A mesma carta pode ser ressuscitada várias vezes na
mesma batalha, sem um limite fixo de quantidade de ressurreições, desde que
seja derrotada em combate novamente entre cada retorno. Não existe uma ação
voluntária para matar ou sacrificar a carta.

**Critérios de aceitação**

- Dado que uma carta está inativa após ser derrotada, quando uma habilidade de
  ressurreição válida é usada, então a carta volta a ficar ativa no espaço que
  ocupava.
- Dado que a habilidade de ressurreição é fraca, quando o efeito é resolvido,
  então a carta pode retornar com 1 ponto de vida e sem exigir vida cheia.
- Dado que a habilidade de ressurreição é forte e tem custo correspondente,
  quando o efeito é resolvido, então a carta pode retornar com vida cheia e
  receber os buffs definidos pela habilidade.
- Dado que uma habilidade não tem custo ou efeito de ressurreição válido,
  quando tenta atingir uma carta derrotada, então a carta permanece inativa.
- Dado que uma carta já foi ressuscitada anteriormente, quando uma habilidade
  válida a ressuscita novamente, então ela pode voltar a ficar ativa sem que um
  limite fixo de ressurreições impeça o efeito.
- Dado que uma carta está ativa, quando o jogador tenta sacrificá-la ou matá-la
  voluntariamente, então essa ação não existe e a carta não é derrotada por
  esse comando.
- Dado que uma carta ressuscitada é derrotada novamente em combate, quando uma
  habilidade válida é usada depois da derrota, então ela pode ser ressuscitada
  novamente.

**Origem:** o grupo quer que o resultado da ressurreição varie conforme a
  habilidade: um investimento maior pode produzir um retorno completo com
  buffs, enquanto um efeito menor oferece apenas uma chance de voltar com 1 de
  vida.

**Hipótese de protótipo**

- **Valor inicial:** ressurreição fraca retorna com 1 de vida; ressurreição
  forte pode retornar com vida cheia e buffs
- **Pergunta do protótipo:** a diferença de custo e retorno cria decisões de
  risco e recompensa sem tornar a ressurreição forte obrigatória?
- **Teto ou limite de exploração:** testar duas habilidades de ressurreição,
  uma fraca e uma forte, e uma build que use derrotas em combate e ressurreição
  como estratégia central, sem sacrifício voluntário.

### RF-AGE-018 — Posicionamento e reorganização por turno

**Prioridade:** DEVE
**Status:** PROVISÓRIO

Uma carta ressuscitada retorna ao mesmo espaço que ocupava quando foi
derrotada. Na preparação de cada turno, o jogador pode reorganizar as cartas
ativas da própria formação, usando posições como frente e retaguarda para
proteger suportes e expor ou defender tanques.

O inimigo também pode reorganizar suas cartas entre as posições disponíveis por
meio da IA. Para desafios mais avançados, o inimigo pode receber buffs
equivalentes a investimentos de skill points, sem alterar as regras básicas de
energia, formação ou combate.

**Critérios de aceitação**

- Dado que uma carta foi ressuscitada, quando retorna ao campo, então ocupa o
  mesmo espaço que ocupava antes de ser derrotada.
- Dado que começa a preparação de um turno, quando o jogador reorganiza suas
  cartas ativas, então pode alterar a posição delas dentro da formação.
- Dado que o jogador posiciona um tanque à frente e uma carta de suporte atrás,
  quando o turno é resolvido, então a formação mantém essa organização até
  outra reorganização permitida.
- Dado que uma carta está inativa, quando o jogador tenta reorganizá-la, então
  ela não pode ser usada como carta ativa até ser ressuscitada.
- Dado que é a preparação do turno do inimigo, quando a IA reorganiza sua
  formação, então pode alterar a posição de suas cartas ativas usando as mesmas
  posições disponíveis ao jogador.
- Dado que um inimigo avançado possui um buff equivalente a skill points,
  quando seus atributos ou efeitos são resolvidos, então o buff é aplicado como
  uma melhoria explícita, sem criar uma regra secreta de combate.
- Dado que o jogador está na preparação para enfrentar um inimigo, quando
  consulta seus dados, então pode conhecer o arquétipo, os buffs e suas
  características principais antes de montar a resposta estratégica.
- Dado que o inimigo possui um playstyle conhecido, quando o jogador prepara a
  batalha, então pode adaptar deck, posicionamento e uso de energia para
  enfrentá-lo.

### RF-AGE-020 — Formações coerentes

**Prioridade:** DEVE
**Status:** CONFIRMADO

O jogador pode escolher até quatro cartas para formar uma composição coerente
com seu playstyle. Cada inimigo deve entrar na batalha com uma formação própria
e coerente, em que cartas, passivas, buffs e arquétipo de IA contribuam para
uma estratégia identificável.

**Critérios de aceitação**

- Dado que o jogador está na preparação, quando escolhe sua formação, então
  pode selecionar até quatro cartas de acordo com seu playstyle.
- Dado que um inimigo é apresentado antes da batalha, quando sua formação é
  consultada, então suas cartas, passivas, buffs e arquétipo de IA apresentam
  uma estratégia identificável em conjunto.
- Dado que o jogador conhece a formação e o playstyle do inimigo, quando
  prepara seu próprio duelo, então pode escolher cartas e posicionamento para
  responder à estratégia adversária.
- Dado que uma formação inimiga é carregada, quando suas cartas são avaliadas,
  então não é necessário que elas sejam escolhidas aleatoriamente sem relação
  entre si.

**Origem:** o grupo quer liberdade para o jogador escolher a formação conforme
  seu playstyle, mas quer que cada inimigo tenha um deck com identidade e
  sinergia próprias para produzir desafios intencionais.

**Origem:** o grupo quer que tanques possam ser colocados na frente para
  proteger suportes atrás, criando uma decisão tática em cada turno. A carta
  ressuscitada retorna ao espaço original para preservar a consequência de sua
  derrota.

**Hipótese de protótipo**

- **Valor inicial:** reorganização permitida uma vez na preparação de cada
  turno; duas posições: frente e retaguarda
- **Pergunta do protótipo:** a reorganização por turno cria decisões relevantes
  sem tornar o posicionamento excessivamente complexo?
- **Teto ou limite de exploração:** testar duas linhas de posicionamento e até
  quatro cartas ativas.

### RF-AGE-003 — Energia inicial e limite

**Prioridade:** DEVE
**Status:** PROVISÓRIO

O jogador começa a batalha com 75 pontos de energia e um limite máximo inicial
de 100 pontos.

**Critérios de aceitação**

- Dado que uma batalha começou, quando o estado do jogador é apresentado,
  então sua energia atual é 75 e seu limite máximo é 100.
- Dado que a energia está no limite máximo, quando uma regeneração ou ganho
  ocorre, então a energia não ultrapassa o limite vigente.

**Origem:** o grupo quer limitar as jogadas sem depender de sorte ou de
  combinações elementais obrigatórias.

**Hipótese de protótipo**

- **Valor inicial:** 75 de energia atual e 100 de energia máxima
- **Pergunta do protótipo:** esse intervalo permite decisões significativas
  entre usar cartas agora e guardar energia para o próximo turno?
- **Teto ou limite de exploração:** testar limite máximo entre 100 e 125 e
  energia inicial entre 50 e 100 nesta rodada.

### RF-AGE-004 — Regeneração de energia

**Prioridade:** DEVE
**Status:** PROVISÓRIO
**Depende de:** RF-AGE-002

No início de cada turno do jogador, sua energia regenera 25 pontos, respeitando
o limite máximo vigente.

**Critérios de aceitação**

- Dado que é o início do turno do jogador e sua energia está abaixo do limite,
  quando a regeneração acontece, então sua energia aumenta em 25 pontos ou até
  atingir o limite máximo, o que ocorrer primeiro.
- Dado que a energia está no limite máximo, quando a regeneração acontece,
  então o valor permanece no limite máximo.

**Origem:** a regeneração parcial mantém o ritmo das batalhas e permite que
  passivas modifiquem a recuperação do jogador ou do inimigo.

**Hipótese de protótipo**

- **Valor inicial:** 25 pontos por turno
- **Pergunta do protótipo:** 25 pontos criam escolhas sem tornar a espera pela
  próxima jogada frustrante?
- **Teto ou limite de exploração:** testar regeneração entre 15 e 35 pontos por
  turno nesta rodada.

### RF-AGE-005 — Custo proporcional ao poder

**Prioridade:** DEVE
**Status:** PROVISÓRIO

O custo de energia de uma carta ou habilidade varia conforme a força ou o poder
do ataque, permitindo que o jogador prepare ataques mais fortes por vários
turnos.

**Critérios de aceitação**

- Dado que duas ações têm poderes diferentes, quando seus custos são exibidos,
  então a ação de maior poder tem custo de energia maior, salvo uma regra
  explícita da carta ou habilidade.
- Dado que o jogador não possui energia suficiente para uma ação, quando tenta
  executá-la, então a ação não é ativada e a energia não é consumida.
- Dado que o jogador está guardando energia para uma ação poderosa, quando
  encerra um turno, então pode manter a energia para tentar executar a ação em
  um turno posterior.

**Origem:** o grupo quer permitir jogadas estratégicas que levem vários turnos
para serem preparadas, em vez de limitar todas as ações ao mesmo custo.

**Hipótese de protótipo**

- **Valor inicial:** faixas aproximadas de 25, 50, 75 e 100 pontos para ações
  de poder crescente
- **Pergunta do protótipo:** guardar energia para ataques fortes cria decisões
  interessantes sem tornar as ações menores irrelevantes?
- **Teto ou limite de exploração:** testar até três faixas de custo e não mais
  que três turnos de preparação para a jogada mais cara nesta rodada; os
  valores podem variar em torno das faixas de referência.

## Alternativas descartadas

- Energia determinada por sorte ou por combinações obrigatórias de elementos.
  Descartada porque cria dependência de sorte e pode impedir o uso de cartas.

## Perguntas em aberto

- Qual é o custo de cada tipo de carta e habilidade?
- Qual ajuste final deve ser feito nas faixas de 25, 50, 75 e 100 após o teste?

### RF-AGE-006 — Potencial ativável das cartas

**Prioridade:** DEVE
**Status:** PROVISÓRIO

Cada carta que representa um personagem possui atributos base próprios, e pode
ter uma habilidade ativável que desbloqueia seu potencial durante um turno da
batalha mediante pagamento de energia.

A duração e a regra de reutilização do potencial são definidas pela carta. Um
potencial pode permanecer ativo até o fim da batalha sem poder ser reativado,
ou durar uma quantidade de turnos e permitir nova ativação imediatamente ou
após um cooldown.

**Critérios de aceitação**

- Dado que uma carta está em campo, quando seus atributos base são consultados,
  então eles estão disponíveis sem que o jogador precise ativar uma habilidade.
- Dado que a carta possui potencial desbloqueável e o jogador tem energia
  suficiente, quando ativa a habilidade durante seu turno, então o efeito do
  potencial é aplicado e o custo correspondente é descontado.
- Dado que o jogador não tem energia suficiente, quando tenta ativar o
  potencial, então o efeito não é aplicado e a energia não é descontada.
- Dado que um potencial permanece ativo até o fim da batalha, quando o jogador
  tenta ativá-lo novamente, então a ativação não ocorre.
- Dado que um potencial temporário terminou sua duração e não possui cooldown,
  quando o jogador tem energia suficiente e o ativa, então o efeito é aplicado
  novamente.
- Dado que um potencial está em cooldown, quando o jogador tenta ativá-lo antes
  do cooldown terminar, então a ativação não ocorre.

**Origem:** o grupo quer que personagens tenham identidade própria, como um
cavaleiro com defesa base maior, mas que o jogador precise escolher o momento
de gastar energia para desbloquear seu verdadeiro potencial.

**Hipótese de protótipo**

- **Valor inicial:** custo definido de acordo com o poder da habilidade, usando
  como referência ações fracas de 10, médias de 25 e fortes de 40 a 50 pontos
- **Pergunta do protótipo:** decidir quando desbloquear o potencial cria uma
  escolha relevante sem tornar o atributo base pouco importante?
- **Teto ou limite de exploração:** testar uma habilidade ativável por carta e
  até 50 pontos de custo nesta rodada.
- Os buffs alteram a energia atual, o limite máximo, a regeneração ou mais de um
  desses valores?
- Quais habilidades podem curar ou ressuscitar cartas derrotadas?
- Quais cartas possuem potencial ativável e qual é o efeito de cada potencial?
- Qual duração ou cooldown cada potencial terá?
- Qual moeda é usada para a compra direta e para os boosters?
- Como o preço direto se compara ao custo dos boosters?
- Quais upgrades podem ser comprados com skill points e como a árvore é
  organizada?

### RF-AGE-011 — Recompensas por vitória

**Prioridade:** DEVE
**Status:** CONFIRMADO

Ao vencer uma batalha, o jogador recebe moedas e skill points. Moedas podem ser
usadas para comprar boosters e cartas diretamente; skill points só podem ser
investidos nas árvores de upgrades.

Os valores das duas recompensas aumentam conforme a dificuldade do inimigo ou
chefe derrotado.

**Critérios de aceitação**

- Dado que o jogador derrotou todas as cartas inimigas, quando a vitória é
  confirmada, então recebe moedas e skill points.
- Dado que o jogador recebeu moedas, quando acessa a aquisição de cartas, então
  pode usá-las para comprar boosters ou cartas disponíveis.
- Dado que o jogador recebeu skill points, quando acessa uma árvore de
  upgrades, então pode investi-los em melhorias disponíveis.
- Dado que o jogador possui qualquer um dos recursos, quando tenta usá-lo na
  finalidade do outro recurso, então a compra ou melhoria não é permitida.
- Dado que duas batalhas têm dificuldades diferentes, quando o jogador vence a
  batalha mais difícil, então recebe mais moedas e skill points do que na
  batalha mais fácil, considerando a mesma categoria de recompensa.

**Origem:** o grupo definiu que ambos os recursos vêm de vencer batalhas, mas
  devem permanecer separados para que aquisição de cartas e upgrades sejam
  decisões diferentes. O aumento por dificuldade incentiva o risco, acompanha
  custos maiores e faz a progressão escalar com o desafio.

**Hipótese de protótipo**

- **Valor inicial:** recompensas crescentes por dificuldade, sem fórmula final
- **Pergunta do protótipo:** o aumento de recompensa torna inimigos difíceis
  atraentes sem permitir que uma única vitória desequilibre a progressão?
- **Teto ou limite de exploração:** testar três níveis de recompensa ligados a
  três níveis de dificuldade, sem multiplicador maior que 3 nesta rodada.

### RF-AGE-012 — Progressão de áreas e nêmesis regional

**Prioridade:** DEVE
**Status:** PROVISÓRIO

As áreas são apresentadas em uma sequência fixa. Em cada área, o jogador pode
escolher quais chefes enfrentar antes de desafiar o campeão fixo da área, que é
o adversário mais forte e funciona como seu nêmesis regional.

Os chefes escolhíveis servem principalmente como fontes de recompensas para
fortalecer o deck antes do confronto contra o campeão da área.

Após alcançar o prestígio necessário, o jogador pode seguir diretamente para o
campeão da área, pulando os chefes menores. Essa rota reduz as recompensas, mas
acelera a progressão. Caso permaneça na rota regular, o jogador pode ignorar
chefes menores ou enfrentá-los em ordem crescente de dificuldade.

Cada chefe derrotado concede pontos de prestígio iguais ao número do estágio em
que está. Um novo prestígio só fica disponível depois que o jogador derrota o
campeão do estágio seguinte ao campeão mais avançado já derrotado.

**Critérios de aceitação**

- Dado que o jogador concluiu uma área, quando escolhe continuar a progressão,
  então a próxima área segue a ordem definida do jogo.
- Dado que o jogador está em uma área com múltiplos chefes disponíveis, quando
  escolhe um chefe, então pode enfrentar esse chefe antes do campeão da área.
- Dado que o jogador está em uma área, quando consulta o confronto principal,
  então o campeão da área é fixo e identificável.
- Dado que o jogador derrota o campeão da área, quando a vitória é confirmada,
  então pode avançar para a próxima área.
- Dado que o jogador derrota um chefe escolhível, quando a recompensa é
  concedida, então recebe recursos ou cartas que podem fortalecer a formação
  para o campeão da área.
- Dado que o jogador alcançou o prestígio necessário, quando escolhe a rota
  acelerada, então pode desafiar diretamente o campeão da área.
- Dado que o jogador usa a rota acelerada, quando a recompensa da área é
  calculada, então recebe menos recompensas do que receberia enfrentando os
  chefes menores disponíveis.
- Dado que o jogador permanece na rota regular, quando escolhe os chefes
  menores, então pode ignorá-los ou enfrentá-los em ordem crescente de
  dificuldade.
- Dado que um chefe está no estágio 1, quando o jogador o derrota, então recebe
  1 ponto de prestígio.
- Dado que um chefe está no estágio 2, quando o jogador o derrota, então recebe
  2 pontos de prestígio.
- Dado que o jogador derrotou o campeão do estágio 2, quando tenta prestigiar
  novamente, então precisa primeiro derrotar o campeão do estágio 3.

**Origem:** o grupo quer que cada campeão regional seja um nêmesis reconhecível
  e faça a progressão parecer uma batalha pessoal, enquanto a escolha de chefes
  oferece recompensas para construir um deck forte o suficiente antes do
  confronto principal. Depois do prestígio, a rota acelerada permite repetir a
  progressão com menos tempo, aceitando menos recompensas.

**Hipótese de protótipo**

- **Valor inicial:** pontos de prestígio = número do estágio; novo prestígio
  exige a derrota do campeão do estágio seguinte
- **Pergunta do protótipo:** os números crescentes comunicam progresso e
  aceleram a recuperação sem permitir progressão excessiva por repetição?
- **Teto ou limite de exploração:** testar até três estágios e manter a regra
  provisória até o balanceamento comparar os ganhos entre jogadores.

### RF-AGE-019 — Derrota e continuidade da jornada

**Prioridade:** DEVE
**Status:** CONFIRMADO

O campeão mundial é o chefe final do jogo. A jornada continua quando o jogador
perde para um chefe: ele pode se preparar e tentar o mesmo confronto novamente
ou abandonar a batalha e escolher outro chefe disponível.

**Critérios de aceitação**

- Dado que o jogador perde uma batalha contra um chefe que não é o campeão
  mundial, quando a derrota é resolvida, então a jornada não termina.
- Dado que o jogador perdeu para um chefe, quando acessa a etapa de preparação,
  então pode ajustar sua estratégia antes de tentar novamente.
- Dado que existem outros chefes disponíveis, quando o jogador abandona o
  confronto perdido, então pode escolher outro chefe disponível.
- Dado que o jogador derrota o campeão mundial, quando a vitória é confirmada,
  então a jornada termina com a vitória final.

**Origem:** o grupo quer que a derrota permita aprendizado e adaptação. O
  jogador pode voltar mais preparado ou escolher outro caminho, enquanto o
  campeão mundial preserva um objetivo final claro.

### RF-AGE-013 — Árvore de upgrades e redistribuição

**Prioridade:** DEVE
**Status:** PROVISÓRIO

As árvores de upgrades são ramificadas e organizadas por níveis. As três
habilidades iniciais mais básicas custam 1 skill point cada; habilidades mais
fortes custam progressivamente mais pontos. O jogador pode remover avanços já
comprados e redistribuir os skill points para experimentar outra build. O
respec devolve integralmente todos os pontos investidos.

Durante a troca de estágio, o jogador pode iniciar um respec a qualquer
momento. Depois que inicia uma batalha ou a preparação de uma batalha, o respec
fica bloqueado até a próxima troca de estágio.

**Critérios de aceitação**

- Dado que o jogador acessa uma árvore de upgrades nova, quando consulta as
  três habilidades iniciais, então cada uma apresenta custo de 1 skill point.
- Dado que uma habilidade pertence a um nível mais forte que as iniciais,
  quando seu custo é apresentado, então ele é maior que 1 e segue a progressão
  definida pela árvore.
- Dado que o jogador possui skill points suficientes, quando compra uma
  habilidade desbloqueada, então os pontos são descontados e o upgrade fica
  ativo.
- Dado que o jogador possui um upgrade comprado, quando escolhe removê-lo
  conforme as regras de respec, então o avanço é removido e os pontos podem ser
  redistribuídos em outra parte da árvore.
- Dado que o jogador remove um ou mais upgrades, quando o respec é concluído,
  então recebe de volta o valor total dos skill points investidos nesses
  upgrades.
- Dado que o jogador está na transição de estágio, quando acessa a árvore de
  upgrades, então pode iniciar um respec em qualquer momento dessa transição.
- Dado que o jogador iniciou uma batalha ou sua preparação, quando tenta
  remover um upgrade, então o respec não é permitido.
- Dado que o jogador concluiu a troca de estágio seguinte, quando acessa a
  árvore de upgrades, então o respec volta a estar disponível.

**Origem:** o grupo escolheu uma estrutura semelhante à skill tree de Payday 2,
  com níveis e ramificações, porque habilidades básicas devem ser acessíveis e
  habilidades fortes devem exigir maior investimento. A possibilidade de
  retirar investimentos aumenta a variedade de builds sem prender o jogador a
    uma única escolha. A devolução integral também incentiva criatividade e novas
    tentativas.

**Hipótese de protótipo**

- **Valor inicial:** três habilidades básicas a 1 ponto; custos crescentes para
  os níveis seguintes; respec permitido durante toda a transição de estágio e
  bloqueado após o início da batalha ou de sua preparação
- **Pergunta do protótipo:** custos crescentes e redistribuição produzem builds
  distintas sem tornar as habilidades fortes obrigatórias?
- **Teto ou limite de exploração:** testar três níveis de uma árvore e uma
  redistribuição completa por ciclo de teste.
- Quantos pontos de vida e defesa as cartas terão no protótipo?

## Não aplicável a este jogo

- Personagem principal controlável — o jogo usa o jogador como self-insert e o
  controle é feito por cartas e decisões de duelo.
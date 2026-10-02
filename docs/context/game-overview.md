# Visão Geral do Jogo

## Proposta

O jogador abre booster packs, coleciona cartas de eras temáticas diferentes,
monta um deck, derrota chefes e inimigos progressivamente mais fortes e busca
se tornar o campeão mundial.

## Intenção de design

A combinação de coleção, eras temáticas, construção de decks e batalhas deve
criar uma sensação de progressão e oferecer diversidade de estilos de jogo
enquanto o jogador avança em direção a um objetivo maior.

## Experiência pretendida

Durante uma tentativa, o jogador deve sentir satisfação ao superar e derrotar
inimigos. Depois da vitória, deve receber recompensas que mantenham o ciclo de
engajamento: abrir boosters, avaliar as cartas obtidas, montar ou ajustar o
deck estrategicamente e investir os skill points conquistados antes de voltar
à batalha.

Essa sequência deve incentivar o jogador a iniciar novas tentativas, buscando
repetir a sensação de vitória e descobrir melhorias para o próprio deck.

O jogador participa como um self-insert, sentindo-se diretamente como o
duelista. As batalhas não são mediadas por um personagem principal, para que a
experiência de jogar TCG esteja conectada ao próprio jogador.

Uma jornada só termina quando o jogador derrota o campeão mundial, que é o
chefe final do jogo. Perder para outro chefe não encerra a jornada: o jogador
pode se preparar e tentar novamente ou abandonar aquele confronto e escolher
outro chefe disponível.

O sistema de energia deve limitar as jogadas sem depender de combinações
obrigatórias entre elementos ou de sorte para liberar o uso de cartas. A
regeneração parcial por turno cria decisões estratégicas, enquanto habilidades
passivas podem aumentar a regeneração do jogador ou prejudicar a regeneração do
inimigo.

Cada duelista entra na batalha com até quatro cartas previamente escolhidas em
campo. Upgrades podem aumentar esse limite durante a progressão. A batalha
termina quando todas as cartas de um dos duelistas forem derrotadas.

As quatro cartas escolhidas são as únicas cartas usadas durante o duelo. O
jogador pode ajustar a formação e trocar cartas entre batalhas, durante a
etapa de preparação.

O inimigo segue a mesma regra: começa com até quatro cartas escolhidas e não
adiciona novas cartas durante a batalha. Quando uma carta é derrotada, ela fica
inativa e visualmente acinzentada pelo restante do duelo, salvo se uma
habilidade permitir sua ressurreição.

O estado de uma carta ressuscitada depende da habilidade usada. Ressurreições
mais caras podem devolver a carta com vida cheia e buffs, enquanto habilidades
mais fracas podem devolvê-la com apenas 1 ponto de vida.

Uma carta ressuscitada retorna ao mesmo espaço que ocupava. Durante a
preparação de cada turno, o jogador pode reorganizar as cartas ativas na
formação, colocando, por exemplo, tanques na frente e cartas de suporte atrás.

O inimigo também pode reorganizar suas cartas entre frente e retaguarda, de
acordo com as decisões da IA. A IA deve competir em igualdade com o jogador,
embora alguns inimigos possam ter buffs equivalentes a investimentos de skill
points para representar desafios mais avançados.

Antes da batalha, o jogador pode conhecer o arquétipo, os buffs e as
características principais do inimigo. Isso permite adaptar o deck, o
posicionamento e o uso de energia para superar playstyles específicos.

O jogador pode escolher sua formação de até quatro cartas de acordo com o
próprio playstyle. Cada inimigo deve possuir uma formação coerente, com cartas,
passivas, buffs e arquétipo de IA que façam sentido em conjunto.

Uma carta pode ser ressuscitada várias vezes na mesma batalha, sem um limite
fixo, desde que seja derrotada em combate novamente entre as ressurreições. Não
existe uma ação voluntária para matar ou sacrificar a carta; builds de
"sacrifício" planejam a derrota em combate para depois aproveitar a
ressurreição.

As cartas possuem pontos de vida e defesa próprios. Ataques reduzem a
capacidade de sobrevivência das cartas adversárias até que elas sejam
derrotadas.

Como referência inicial de raridade, uma carta comum possui 50 pontos de vida
e 5 de defesa, enquanto uma carta normal ou incomum possui 100 pontos de vida
e 10 de defesa. Esses valores não definem todas as cartas: personagens podem
ter perfis extremos, como 1 ponto de vida e 75 de defesa ou muitos pontos de
vida e pouca defesa, criando sinergias entre cartas, atributos e passivas.

Cartas mais raras devem ser mais fortes que cartas comuns, aumentando a
expectativa de encontrar uma recompensa valiosa nos boosters. Para não obrigar
o jogador a depender da sorte, uma carta desejada também pode ser comprada
diretamente, provavelmente exigindo um investimento maior, mas garantindo sua
obtenção.

Moedas são usadas para comprar boosters e cartas diretamente. Skill points são
um recurso separado, usado exclusivamente nas árvores de upgrades.

O jogador recebe moedas e skill points ao vencer batalhas. Apesar de terem a
mesma fonte principal, os recursos continuam tendo usos diferentes.

As árvores de upgrades usam uma estrutura ramificada por níveis, inspirada na
skill tree de Payday 2: as três habilidades iniciais mais básicas custam 1
skill point cada, enquanto habilidades mais fortes ficam progressivamente mais
caras. O jogador pode remover investimentos da árvore e redistribuir os pontos
para experimentar diferentes builds. O respec devolve integralmente os skill
points investidos, incentivando novas tentativas, criatividade e variedade de
playstyles.

Durante a troca de estágio, o jogador pode realizar o respec a qualquer
momento. Depois que inicia uma batalha ou a preparação para uma batalha, perde
essa possibilidade e só pode fazer respec novamente na próxima troca de
estágio.

Os valores de moedas e skill points aumentam conforme a dificuldade do inimigo
ou chefe derrotado. Isso incentiva o jogador a assumir riscos, acompanha o
custo crescente de cartas e upgrades e faz a progressão escalar junto com o
desafio.

As áreas seguem uma sequência fixa. Dentro de cada área, o jogador pode
escolher quais chefes enfrentar, mas o campeão da área é um adversário fixo e
mais forte. Esse campeão funciona como um nêmesis regional, tornando o avanço
uma batalha pessoal para o jogador.

Os chefes escolhíveis existem principalmente para oferecer recompensas que
ajudem o jogador a construir um deck forte o suficiente para enfrentar o
campeão da área.

Depois de obter prestígio suficiente, o jogador pode escolher ir diretamente
ao campeão da área, pulando os chefes menores. Essa rota reduz as recompensas
obtidas, mas torna a progressão mais rápida para quem já está mais forte.
Quando não escolher essa rota, o jogador pode ignorar chefes menores ou
enfrentá-los em ordem crescente de dificuldade.

Cada chefe derrotado concede pontos de prestígio iguais ao número do estágio:
um ponto no primeiro estágio, dois no segundo, três no terceiro e assim por
diante. O jogador só pode prestigiar depois de derrotar o campeão do estágio
seguinte ao campeão mais avançado que já derrotou. Por exemplo, depois de
derrotar o campeão do segundo estágio, precisa derrotar o campeão do terceiro
para prestigiar novamente.

Na resolução de um ataque, a defesa é subtraída diretamente do dano. Por
exemplo, um ataque de 20 contra uma carta com 5 de defesa causa 15 de dano.

Quando uma carta é derrotada, o espaço que ela ocupava permanece vazio e não
permite substituição normal durante a batalha. Habilidades específicas podem
restaurar uma carta ao campo por meio de cura ou ressurreição.

As batalhas usam turnos alternados, e o jogador sempre realiza o primeiro
turno.

O jogador começa com 75 pontos de energia, tem um limite inicial de 100 pontos
e recupera 25 pontos no início de cada turno. Upgrades e buffs de cartas podem
alterar o limite máximo e a regeneração.

O custo de energia varia conforme a força ou o poder do ataque. Isso permite
que o jogador economize energia e prepare jogadas mais fortes ao longo de
vários turnos.

Durante o próprio turno, o jogador pode escolher livremente entre gastar a
energia em várias ações, guardar energia para um combo mais forte ou gastar
tudo de uma vez. O jogador encerra o turno manualmente.

O inimigo usa o mesmo sistema de energia e ações durante o próprio turno, mas
suas decisões são controladas por uma inteligência artificial.

Inimigos diferentes podem usar estilos de IA distintos, como agressivo,
defensivo ou focado em combos. Essa variedade deve mudar a forma como o jogador
monta seu deck e decide guardar ou gastar energia.

Como referência inicial, os custos podem se organizar aproximadamente em
faixas de 25, 50, 75 e 100 pontos, sem impedir ajustes durante o balanceamento.

Cada carta que representa um personagem possui atributos próprios, como um
cavaleiro ter defesa base maior. O jogador pode ativar durante a batalha uma
habilidade que desbloqueia o potencial desse personagem; essa ativação consome
energia e pode ocorrer em um turno específico.

A forma de reutilização depende da carta: alguns potenciais permanecem ativos
até o fim da batalha e não podem ser ativados novamente; outros duram uma
quantidade definida de turnos e podem ser reativados imediatamente ou depois
de um cooldown específico.

## Eixos estruturais

- **Ritmo:** por turnos alternados; o jogador sempre começa
- **Unidade de jogo:** jornada contínua até o campeão mundial, com batalhas e
	escolhas de chefes ao longo da progressão
- **Controle:** indireto sobre cartas, deck e decisões de duelo; não há
	personagem principal controlável
- **Fim:** tem fim definido: alcançar o título de campeão mundial

## Gênero e referências

- **Gênero:** jogo de cartas com construção de deck e estrutura roguelike.
- **Genshin Impact:** referência para a variedade de cartas e seus elementos.
- **Balatro:** referência para a construção de deck e para o ciclo roguelike em
	que o jogador perde, aprende e retorna mais forte, aumentando a
	rejogabilidade.
- **Yu-Gi-Oh!:** referência para a construção de decks e os duelos baseados em
	cartas.

Essas referências foram escolhidas para combinar variedade estratégica,
personalização do deck e progressão por repetição após a derrota.
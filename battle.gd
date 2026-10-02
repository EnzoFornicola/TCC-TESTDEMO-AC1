extends Control

const BG := Color("101827")
const PANEL := Color("1b2a40")
const PANEL_DARK := Color("142033")
const GOLD := Color("f2c66d")
const ICE := Color("d9e5f2")
const MUTED := Color("8ea4bd")
const RED := Color("f47c7c")
const GREEN := Color("8bd6a1")

var player_energy := 75
var player_max_energy := 100
var enemy_energy := 75
var enemy_max_energy := 100
var turn_number := 1
var player_turn := true
var selected_player := 0
var selected_target := 0
var battle_over := false
var message := "Escolha uma carta e uma acao. O jogador comeca."
var in_menu := true

var player_cards := [
    {"name":"Cavaleiro Guardiao", "era":"Medieval", "role":"TANQUE", "hp":100, "max_hp":100, "def":10, "atk":10, "active":true, "passive":"Muralha", "ability":"Provocar", "cost":25, "ability_text":"Atrai o proximo ataque inimigo."},
    {"name":"Robin Hood", "era":"Medieval", "role":"DANO", "hp":50, "max_hp":50, "def":5, "atk":20, "active":true, "passive":"Tiro Preciso", "ability":"Flecha Perfurante", "cost":25, "ability_text":"Causa 30 de dano ignorando 2 de defesa."},
    {"name":"Atena", "era":"Grega", "role":"DEFESA", "hp":100, "max_hp":100, "def":10, "atk":10, "active":true, "passive":"Estrategia", "ability":"Egide", "cost":25, "ability_text":"Concede +20 defesa por um turno."},
    {"name":"Freyja", "era":"Nordica", "role":"RESSURREICAO", "hp":50, "max_hp":50, "def":5, "atk":10, "active":true, "passive":"Seidr", "ability":"Retorno", "cost":50, "ability_text":"Ressuscita uma carta derrotada com vida cheia."}
]

var enemy_cards := [
    {"name":"Thor", "era":"Nordica", "role":"AGRESSIVO", "hp":100, "max_hp":100, "def":10, "atk":25, "active":true, "passive":"Trovao", "ability":"Mjolnir", "cost":50, "ability_text":"Causa dano pesado ao alvo."},
    {"name":"Esfinge", "era":"Egipcia", "role":"DEFENSIVO", "hp":1, "max_hp":1, "def":75, "atk":10, "active":true, "passive":"Enigma", "ability":"Pergunta", "cost":40, "ability_text":"Bloqueia a habilidade de uma carta."},
    {"name":"Medusa", "era":"Grega", "role":"CONTROLE", "hp":50, "max_hp":50, "def":5, "atk":15, "active":true, "passive":"Petrificar", "ability":"Olhar", "cost":40, "ability_text":"Impede o alvo de atacar no proximo turno."},
    {"name":"Valquiria", "era":"Nordica", "role":"COMBO", "hp":50, "max_hp":50, "def":5, "atk":15, "active":true, "passive":"Caidos", "ability":"Convocar", "cost":25, "ability_text":"Ressuscita uma carta derrotada com 1 vida."}
]

var ui := {}

func _ready() -> void:
    _build_shell()
    _build_menu()
    _build_audio()
    _redraw()

func _style_box(color: Color, radius := 10, border := Color.TRANSPARENT, width := 0) -> StyleBoxFlat:
    var box := StyleBoxFlat.new()
    box.bg_color = color
    box.corner_radius_top_left = radius
    box.corner_radius_top_right = radius
    box.corner_radius_bottom_left = radius
    box.corner_radius_bottom_right = radius
    box.border_color = border
    box.border_width_left = width
    box.border_width_right = width
    box.border_width_top = width
    box.border_width_bottom = width
    box.content_margin_left = 14
    box.content_margin_right = 14
    box.content_margin_top = 10
    box.content_margin_bottom = 10
    return box

func _label(text: String, size := 16, color := ICE) -> Label:
    var label := Label.new()
    label.text = text
    label.add_theme_font_size_override("font_size", size)
    label.add_theme_color_override("font_color", color)
    return label

func _button(text: String, callback: Callable, enabled := true) -> Button:
    var button := Button.new()
    button.text = text
    button.disabled = not enabled
    button.custom_minimum_size = Vector2(0, 34)
    button.add_theme_font_size_override("font_size", 14)
    button.add_theme_stylebox_override("normal", _style_box(Color("263b55"), 6))
    button.add_theme_stylebox_override("hover", _style_box(Color("365675"), 6))
    button.add_theme_stylebox_override("disabled", _style_box(Color("202c3d"), 6))
    button.pressed.connect(callback)
    return button

func _build_shell() -> void:
    var background := ColorRect.new()
    background.color = BG
    background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(background)
    move_child(background, 0)

    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    margin.add_theme_constant_override("margin_left", 28)
    margin.add_theme_constant_override("margin_right", 28)
    margin.add_theme_constant_override("margin_top", 22)
    margin.add_theme_constant_override("margin_bottom", 22)
    add_child(margin)

    var root := VBoxContainer.new()
    root.add_theme_constant_override("separation", 12)
    margin.add_child(root)

    var header := HBoxContainer.new()
    header.add_theme_constant_override("separation", 18)
    root.add_child(header)

    var title := _label("ERAS DUEL", 30, GOLD)
    header.add_child(title)

    var subtitle := _label("NUCLEO JOGAVEL  /  CICLO 1", 14, MUTED)
    subtitle.size_flags_vertical = Control.SIZE_SHRINK_CENTER
    header.add_child(subtitle)

    var spacer := Control.new()
    spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    header.add_child(spacer)

    ui["status"] = _label("", 16, ICE)
    ui.status.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
    header.add_child(ui.status)

    var enemy_title := _label("INIMIGO  /  FORMACAO COERENTE: AGRESSIVO", 13, RED)
    root.add_child(enemy_title)
    ui["enemy_row"] = HBoxContainer.new()
    ui.enemy_row.add_theme_constant_override("separation", 10)
    ui.enemy_row.size_flags_vertical = Control.SIZE_EXPAND_FILL
    root.add_child(ui.enemy_row)

    var center := PanelContainer.new()
    center.add_theme_stylebox_override("panel", _style_box(PANEL_DARK, 8))
    root.add_child(center)
    var center_row := HBoxContainer.new()
    center_row.add_theme_constant_override("separation", 16)
    center.add_child(center_row)

    ui["turn"] = _label("", 17, GOLD)
    ui.turn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    center_row.add_child(ui.turn)

    ui["energy"] = _label("", 17, ICE)
    center_row.add_child(ui.energy)

    ui["deck_info"] = _label("MOEDAS 12  |  SKILL 0", 14, GOLD)
    center_row.add_child(ui.deck_info)

    ui["end_turn"] = _button("ENCERRAR TURNO", Callable(self, "_end_turn"))
    center_row.add_child(ui.end_turn)

    ui["menu_button"] = _button("MENU", Callable(self, "_toggle_menu"))
    center_row.add_child(ui.menu_button)

    var player_title := _label("JOGADOR  /  ESCOLHA UMA CARTA PARA AGIR", 13, GREEN)
    root.add_child(player_title)
    ui["player_row"] = HBoxContainer.new()
    ui.player_row.add_theme_constant_override("separation", 10)
    ui.player_row.size_flags_vertical = Control.SIZE_EXPAND_FILL
    root.add_child(ui.player_row)

    var footer := PanelContainer.new()
    footer.add_theme_stylebox_override("panel", _style_box(PANEL_DARK, 8))
    root.add_child(footer)
    var footer_row := VBoxContainer.new()
    footer.add_child(footer_row)
    ui["message"] = _label("", 15, ICE)
    footer_row.add_child(ui.message)
    ui["actions"] = HBoxContainer.new()
    ui.actions.add_theme_constant_override("separation", 8)
    footer_row.add_child(ui.actions)

func _build_menu() -> void:
    var overlay := ColorRect.new()
    overlay.color = Color(0, 0, 0, 0.72)
    overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    overlay.mouse_filter = Control.MOUSE_FILTER_STOP
    add_child(overlay)
    ui["menu_overlay"] = overlay

    var center := CenterContainer.new()
    center.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    overlay.add_child(center)

    var shell := PanelContainer.new()
    shell.custom_minimum_size = Vector2(520, 360)
    shell.add_theme_stylebox_override("panel", _style_box(Color("1a2233"), 18, GOLD, 2))
    center.add_child(shell)

    var vbox := VBoxContainer.new()
    vbox.alignment = BoxContainer.ALIGNMENT_CENTER
    vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL
    vbox.add_theme_constant_override("separation", 18)
    shell.add_child(vbox)

    var title := _label("ERAS DUEL", 42, GOLD)
    title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    vbox.add_child(title)

    var sub := _label("TRILHA DE RECOMPENSAS E CASSINO DE CARTAS", 15, MUTED)
    sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    vbox.add_child(sub)

    var flavor := _label("Abre boosters, monta o deck e enfrenta eras rivais para chegar ao campeonato mundial.", 16, ICE)
    flavor.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    flavor.custom_minimum_size = Vector2(440, 80)
    flavor.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    vbox.add_child(flavor)

    var buttons := VBoxContainer.new()
    buttons.add_theme_constant_override("separation", 10)
    vbox.add_child(buttons)

    var start_button := _button("INICIAR BATALHA", Callable(self, "_start_battle"))
    start_button.custom_minimum_size = Vector2(260, 42)
    buttons.add_child(start_button)

    var resume_button := _button("CONTINUAR", Callable(self, "_resume_battle"))
    resume_button.custom_minimum_size = Vector2(260, 42)
    buttons.add_child(resume_button)

    var deck_button := _button("VER DECK", Callable(self, "_show_deck"))
    deck_button.custom_minimum_size = Vector2(260, 42)
    buttons.add_child(deck_button)

    var quit_button := _button("SAIR", Callable(self, "_quit_game"))
    quit_button.custom_minimum_size = Vector2(260, 42)
    buttons.add_child(quit_button)

    ui["menu_title"] = title
    ui["menu_subtitle"] = sub
    ui["menu_flavor"] = flavor
    ui["resume_button"] = resume_button

func _build_audio() -> void:
    var theme := AudioStreamPlayer.new()
    theme.name = "MainTheme"
    theme.set_script(load("res://main_theme.gd"))
    add_child(theme)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        _toggle_menu()

func _toggle_menu() -> void:
    if not ui.has("menu_overlay"):
        return
    in_menu = not in_menu
    if in_menu:
        message = "Menu principal aberto. Continue sua batalha quando quiser."
    else:
        message = "Batalha retomada."
    _redraw()

func _start_battle() -> void:
    in_menu = false
    battle_over = false
    player_turn = true
    message = "Batalha iniciada. Seu deck ja esta pronto."
    if ui.has("menu_overlay"):
        ui.menu_overlay.visible = false
    _redraw()

func _resume_battle() -> void:
    if ui.has("menu_overlay"):
        ui.menu_overlay.visible = false
    in_menu = false
    message = "Batalha retomada."
    _redraw()

func _show_deck() -> void:
    message = "Deck em fase de montagem: foco em sinergia, energia e era dominante."
    _redraw()

func _quit_game() -> void:
    get_tree().quit()

func _card_panel(card: Dictionary, index: int, is_player: bool) -> PanelContainer:
    var selected := is_player and index == selected_player
    var active: bool = card.active
    var border := GOLD if selected else (Color("38516c") if active else Color("343b46"))
    var panel := PanelContainer.new()
    panel.custom_minimum_size = Vector2(0, 150)
    panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    panel.add_theme_stylebox_override("panel", _style_box(PANEL if active else Color("20252d"), 8, border, 2))

    var body := VBoxContainer.new()
    body.add_theme_constant_override("separation", 3)
    panel.add_child(body)

    var name_label := _label(("[INATIVA] " if not active else "") + card.name, 16, ICE if active else MUTED)
    body.add_child(name_label)
    body.add_child(_label(card.era + "  /  " + card.role, 11, GOLD if active else MUTED))
    body.add_child(_label("HP %d/%d   DEF %d   ATK %d" % [card.hp, card.max_hp, card.def, card.atk], 13, GREEN if active else MUTED))

    var bar := ProgressBar.new()
    bar.max_value = card.max_hp
    bar.value = max(0, card.hp)
    bar.custom_minimum_size.y = 8
    body.add_child(bar)
    body.add_child(_label("Passiva: " + card.passive, 11, ICE if active else MUTED))
    body.add_child(_label(card.ability + "  /  " + str(card.cost) + " EN", 11, ICE if active else MUTED))

    if is_player:
        var select_button := _button("SELECIONAR", Callable(self, "_select_player_card").bind(index), active)
        body.add_child(select_button)
    else:
        var target_button := _button("ALVO", Callable(self, "_select_target").bind(index), active)
        body.add_child(target_button)

    return panel

func _redraw() -> void:
    if ui.has("menu_overlay"):
        ui.menu_overlay.visible = in_menu

    if in_menu:
        ui.status.text = "MENU PRINCIPAL"
        return

    for child in ui.enemy_row.get_children():
        child.queue_free()
    for child in ui.player_row.get_children():
        child.queue_free()
    for card_index in enemy_cards.size():
        ui.enemy_row.add_child(_card_panel(enemy_cards[card_index], card_index, false))
    for card_index in player_cards.size():
        ui.player_row.add_child(_card_panel(player_cards[card_index], card_index, true))

    ui.turn.text = ("TURNO DO JOGADOR  #%d" % turn_number) if player_turn else "TURNO DO INIMIGO..."
    ui.energy.text = "ENERGIA  %d / %d" % [player_energy, player_max_energy]
    ui.deck_info.text = "MOEDAS 12  |  SKILL 0"
    ui.message.text = message
    _rebuild_actions()

func _rebuild_actions() -> void:
    for child in ui.actions.get_children():
        child.queue_free()
    var card: Dictionary = player_cards[selected_player]
    var can_act: bool = player_turn and not battle_over and card.active
    ui.actions.add_child(_button("ATAQUE  -  %d EN" % card.cost, Callable(self, "_attack"), can_act and player_energy >= card.cost))
    ui.actions.add_child(_button("HABILIDADE  -  %d EN" % card.cost, Callable(self, "_ability"), can_act and player_energy >= card.cost))
    ui.actions.add_child(_button("MOVER PARA FRENTE", Callable(self, "_move_front"), can_act))
    ui.actions.add_child(_button("MOVER PARA TRAS", Callable(self, "_move_back"), can_act))
    ui.end_turn.disabled = not (player_turn and not battle_over)

func _select_player_card(index: int) -> void:
    if player_turn and not battle_over:
        selected_player = index
        message = "Selecionado: " + player_cards[index].name + ". Escolha um alvo ou reorganize."
        _redraw()

func _select_target(index: int) -> void:
    if player_turn and not battle_over and enemy_cards[index].active:
        selected_target = index
        message = "Alvo selecionado: " + enemy_cards[index].name + "."
        _redraw()

func _attack() -> void:
    var attacker: Dictionary = player_cards[selected_player]
    var target: Dictionary = enemy_cards[selected_target]
    if not attacker.active or not target.active or player_energy < attacker.cost:
        return
    player_energy -= attacker.cost
    var raw_damage: int = attacker.atk
    if attacker.name == "Robin Hood":
        raw_damage += 5
    _deal_damage(target, raw_damage)
    message = "%s atacou %s: %d de dano bruto." % [attacker.name, target.name, raw_damage]
    _check_battle()
    if not battle_over:
        _redraw()

func _ability() -> void:
    var card: Dictionary = player_cards[selected_player]
    if not card.active or player_energy < card.cost:
        return
    player_energy -= card.cost
    if card.name == "Freyja":
        _revive_player_full()
    elif card.name == "Atena":
        card.def += 20
        message = "Atena ativou Egide: +20 DEF temporaria."
    elif card.name == "Robin Hood":
        var target: Dictionary = enemy_cards[selected_target]
        _deal_damage(target, 30, 2)
        message = "Robin Hood usou Flecha Perfurante em %s." % target.name
    elif card.name == "Cavaleiro Guardiao":
        message = "Cavaleiro Guardiao provocou o inimigo."
    _check_battle()
    if not battle_over:
        _redraw()

func _deal_damage(target: Dictionary, raw_damage: int, defense_pierce := 0) -> void:
    if not target.active:
        return
    var reduced: int = max(0, raw_damage - max(0, target.def - defense_pierce))
    target.hp -= reduced
    if target.hp <= 0:
        target.hp = 0
        target.active = false

func _end_turn() -> void:
    if not player_turn or battle_over:
        return
    player_turn = false
    message = "A IA esta analisando a formacao e a energia..."
    _redraw()
    await get_tree().create_timer(0.55).timeout
    _enemy_turn()

func _enemy_turn() -> void:
    if battle_over:
        return
    enemy_energy = min(enemy_max_energy, enemy_energy + 25)
    var living := _active_indices(enemy_cards)
    var targets := _active_indices(player_cards)
    if living.is_empty() or targets.is_empty():
        _check_battle()
        return
    var enemy_index: int = living[0]
    var target_index: int = targets[0]
    var enemy: Dictionary = enemy_cards[enemy_index]
    var target: Dictionary = player_cards[target_index]
    if enemy_energy >= enemy.cost and enemy.name == "Thor":
        enemy_energy -= enemy.cost
        _deal_damage(target, enemy.atk + 15)
        message = "Thor usou Mjolnir contra %s." % target.name
    else:
        enemy_energy -= enemy.cost if enemy_energy >= enemy.cost else 0
        _deal_damage(target, enemy.atk)
        message = "%s atacou %s." % [enemy.name, target.name]
    _check_battle()
    if not battle_over:
        turn_number += 1
        player_energy = min(player_max_energy, player_energy + 25)
        player_turn = true
        _redraw()

func _move_front() -> void:
    _move_selected(0)

func _move_back() -> void:
    _move_selected(player_cards.size() - 1)

func _move_selected(destination: int) -> void:
    if selected_player == destination or not player_cards[selected_player].active:
        return
    var temp: Dictionary = player_cards[destination]
    player_cards[destination] = player_cards[selected_player]
    player_cards[selected_player] = temp
    selected_player = destination
    message = "Formacao reorganizada: tanques na frente, suporte atras."
    _redraw()

func _revive_player_full() -> void:
    for card in player_cards:
        if not card.active:
            card.active = true
            card.hp = card.max_hp
            message = "Freyja ressuscitou %s com vida cheia." % card.name
            return
    message = "Freyja tentou ressuscitar, mas nenhuma carta esta inativa."

func _active_indices(cards: Array) -> Array:
    var result: Array = []
    for index in cards.size():
        if cards[index].active:
            result.append(index)
    return result

func _check_battle() -> void:
    var player_alive := not _active_indices(player_cards).is_empty()
    var enemy_alive := not _active_indices(enemy_cards).is_empty()
    if not enemy_alive:
        battle_over = true
        player_turn = false
        message = "VITORIA! O inimigo foi derrotado. Recompensa: moedas + skill points."
    elif not player_alive:
        battle_over = true
        player_turn = false
        message = "DERROTA. Reorganize sua build e tente novamente."

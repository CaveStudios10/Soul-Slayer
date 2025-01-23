extends Control

# Dados do diálogo
var dialog_data = [
	{"name": "Fazendeiro", "dialog": "…", "faceset": "res://assets/dialogos/big-garzia-cabeca.png"},
	{"name": "Don Garzia", "dialog": "Hola, forasteiro! Tú és uno daqueles esqueletinhos de foice, né? ¡HA HA HA!, “Eu sou el Grande Garzia!", "faceset": "res://assets/dialogos/big-garzia-cabeca.png"},
	{"name": "Don Garzia", "dialog": "Soy el dueño deste humilde saloon. Yo pediria pra você entrar, pero. Pepe o Mineiro bebeu todo o Estoque.", "faceset": "res://assets/dialogos/big-garzia-cabeca.png"},
	{"name": "Don Garzia", "dialog": "Te desejo sorte contra El Touro. Ele torna o Comercio da Cidade horrivel. Boa Sorte!!.", "faceset": "res://assets/dialogos/big-garzia-cabeca.png"},
]

# Índice atual do diálogo
var current_index: int = 0

# Referências aos nodes
@onready var dialogo = $"."
@onready var name_label = $ColorRect/HBoxContainer/VBoxContainer/Label
@onready var dialog_label = $ColorRect/HBoxContainer/VBoxContainer/RichTextLabel
@onready var faceset = $ColorRect/HBoxContainer/TextureRect

func _ready() -> void:
	# Inicializa o primeiro diálogo
	show_dialog()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"): # Tecla Enter ou botão configurado
		advance_dialog()

func show_dialog() -> void:
	# Verifica se há mais diálogos
	if current_index < dialog_data.size():
		# Define os dados do diálogo atual
		var current_dialog = dialog_data[current_index]
		name_label.text = current_dialog.get("name", "Desconhecido")
		dialog_label.text = current_dialog.get("dialog", "")
		var faceset_path = current_dialog.get("faceset", "")
		if faceset_path != "":
			faceset.texture = load(faceset_path)
		else:
			faceset.texture = null
	else:
		# Encerra o diálogo
		dialogo.visible = false
		current_index = 2

func advance_dialog() -> void:
	# Avança para o próximo diálogo
	current_index += 1
	show_dialog()

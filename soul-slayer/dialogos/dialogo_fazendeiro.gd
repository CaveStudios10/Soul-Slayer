extends Control

# Dados do diálogo
var dialog_data = [
	{"name": "Fazendeiro", "dialog": "…", "faceset": "res://assets/dialogos/gerome-pixilart.png"},
	{"name": "Fazendeiro", "dialog": "AHHHHHHHHH, Um exquilheto, Tá arreprendido em nome de jesus, Primeiro um touro gigante e agora um exquelheto.", "faceset": "res://assets/dialogos/gerome-pixilart.png"},
	{"name": "Fazendeiro", "dialog": "Eu tive que sair da Cidade por causa daquele El Touro. Agora vou morreu para um exqueleto", "faceset": "res://assets/dialogos/gerome-pixilart.png"},
	{"name": "Fazendeiro", "dialog": "Tem uma cidade ali na frente, tenho certeza que tem um senhor bem mais gordinho para vc comer.", "faceset": "res://assets/dialogos/gerome-pixilart.png"},
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

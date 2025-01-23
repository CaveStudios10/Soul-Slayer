extends Control

# Dados do diálogo
var dialog_data = [
	{"name": "Moe", "dialog": "…", "faceset": "res://assets/dialogos/moe-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Aqui ficam os portais, onde nossos caçadores podem ir para diversos lugares e épocas atrás de derrotar aqueles que não aceitam a morte", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Mr. Presindent", "dialog": " aqueles que não aceitam a morte, ou também conhecidos como DETERMINADOS, são seres que, por serem muito fortes, não são derrotados facilmente", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "mas quando são, suas almas se recusam a perecer e depois de um tempo seus corpos voltam ao normal", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "E esse será o seu serviço, derrotar os DETERMINADOS e trazer as almas deles, ao ponto de poderem finalmente ter o seu devido fim.", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Não se preucupe, Vai dar Tuuuudo certo. Agora vá entre no portal e Só volte com a Alma dele.", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
]

# Índice atual do diálogo
var current_index: int = 0

# Referências aos nodes
@onready var dialogo = $"."
@onready var name_label = $ColorRect/HBoxContainer/VBoxContainer/Label
@onready var dialog_label = $ColorRect/HBoxContainer/VBoxContainer/RichTextLabel
@onready var faceset = $ColorRect/HBoxContainer/TextureRect

func _ready() -> void:
	show_dialog()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"): # Tecla Enter ou botão configurado
		advance_dialog()

func show_dialog() -> void:
	# Verifica se há mais diálogos
	#current_index < dialog_data.size():
		
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
		current_index = 4


func advance_dialog() -> void:
	# Avança para o próximo diálogo
	current_index += 1
	show_dialog()

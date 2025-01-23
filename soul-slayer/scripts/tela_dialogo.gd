extends Control

# Dados do diálogo
var dialog_data = [
	{"name": "Moe", "dialog": "…", "faceset": "res://assets/dialogos/moe-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Olá novato, seja bem vindo a Soul Nice Corporation, você pode me chamar de Mr. Pillow, e esse aqui é o velho Moe…”", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Moe", "dialog": "…", "faceset": "res://assets/dialogos/moe-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Ah é, o Moe perdeu a capacidade de falar em sua última missão. Mas relaxa, isso não vai acontecer com você.", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Agora, Primeiramente ande até o moe e bata com essa foice no Moe.", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
	{"name": "Moe", "dialog": "…", "faceset": "res://assets/dialogos/moe-cabeca-pixilart.png"},
	{"name": "Mr. President", "dialog": "Não se preucupe, Moe é duro na queda. Te espero na outra Sala!. Use J ou Z / Mouse - ataque. (Ataque Moe)", "faceset": "res://assets/dialogos/mr-president-cabeca-pixilart.png"},
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
		current_index = 5


func advance_dialog() -> void:
	# Avança para o próximo diálogo
	current_index += 1
	show_dialog()

extends Control

# Dados do diálogo
var dialog_data = [
	{"name": "Fazendeiro", "dialog": "…", "faceset": "res://assets/dialogos/big-garzia-cabeca.png"},
	{"name": "Xerife", "dialog": "Finalmente, um novo caçador apareceu. Eu sou o xerife desta cidade, já faz muito tempo que a sua empresa não manda ninguém.", "faceset": "res://assets/dialogos/xerife-willy-cabeca.png"},
	{"name": "Xerife", "dialog": "Bem-vindo a Fim de Mundo, nosso pequeno pedacinho de terra, meu nome é Willy, sou o xerife aqui.", "faceset": "res://assets/dialogos/xerife-willy-cabeca.png"},
	{"name": "Xerife", "dialog": "A muito tempo estamos sendo atormentados por nosso antigo xerife. Que movido pela ganancia e sede por poder, se tornou um ser terrível", "faceset": "res://assets/dialogos/xerife-willy-cabeca.png"},
	{"name": "Xerife", "dialog": "Siga Reto até chegar em Gregory e Paloma eles estão vijiando o El toro. Cuidado com os Javalis do Deserto!!.", "faceset": "res://assets/dialogos/xerife-willy-cabeca.png"},
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
		current_index = 3

func advance_dialog() -> void:
	# Avança para o próximo diálogo
	current_index += 1
	show_dialog()

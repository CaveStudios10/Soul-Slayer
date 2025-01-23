extends Control

@onready var click = $click
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_voltar_pressed():
	click.play()
	get_tree().change_scene_to_file("res://levels/menu.tscn")

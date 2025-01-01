extends Area2D

var control: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass



func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://levels/fase_deserto_1.tscn")

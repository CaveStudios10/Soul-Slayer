extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta):
	pass



func _on_play_pressed():
	get_tree().change_scene_to_file("res://levels/world_01-1.tscn")


func _on_control_pressed():
	get_tree().change_scene_to_file("res://levels/controle.tscn")


func _on_quit_pressed():
	get_tree().quit()

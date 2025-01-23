extends Control

@onready var animation := AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim_name == "intro"
	get_tree().change_scene_to_file("res://levels/menu.tscn")
	

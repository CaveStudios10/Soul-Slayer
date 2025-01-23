extends Node2D
class_name MoeNpc

@onready var dialogo = $DialogoMoe
var player_in_area = false
@onready var animation = $AnimatedSprite2D
var i = true

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Enter"):
			dialogo.visible = true


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false


func _on_animated_sprite_2d_animation_finished() -> void:
	animation.play("angry")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if i:
			animation.play("hit")
			i = false
		else:
			pass

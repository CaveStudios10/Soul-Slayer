extends Node2D
class_name xerife

@onready var dialogo = $dialogoXerife
@onready var animation = $AnimatedSprite2D
@onready var exclamacion = $exclamacion
var SPEED = 0
var player_in_area = false
const JUMP_VELOCITY = -400.0
var Count = true


func _physics_process(delta):
	if Count:
		if player_in_area and Input.is_action_just_pressed("Enter"):
			dialogo.visible = true
	else:
		pass
	# Add the gravity.

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false

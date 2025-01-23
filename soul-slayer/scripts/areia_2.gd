extends AnimatableBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DANO = 2

@onready var texture := $texture as Sprite2D
@onready var timer : = $Timer

var velocity := Vector2.ZERO
var direction:= -1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	velocity.x = direction * SPEED * delta


	move_and_collide(velocity)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(DANO)

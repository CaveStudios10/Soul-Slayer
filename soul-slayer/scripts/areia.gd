extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DANO = 1

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D
@onready var timer : = $Timer

var direction := -1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if wall_detector.is_colliding():
		queue_free()
	
	velocity.x = direction * SPEED

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(DANO)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	direction = 1
	texture.flip_h = true
	wall_detector.scale.x *= -1

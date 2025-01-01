extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DANO = 2

@onready var texture := $texture as Sprite2D
@onready var timer : = $Timer
@onready var colision := $Area2D/Collision as CollisionShape2D
@onready var colisionA := $CollisionShape2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	
	#velocity.x = direction * SPEED

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(DANO)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	texture.flip_h = true
	texture.position.x = 14
	colision.position.x = 14
	colisionA.position.x = 14

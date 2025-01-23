extends CharacterBody2D

const VIDA_MAX = 4
const SPEED = 3500.0
const JUMP_VELOCITY = -400.0
const DANO = 1
var regu = 1

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D
@onready var animation := $anim as AnimationPlayer
@onready var colision: CollisionShape2D = $atkarea/atkcolision
@onready var timer : = $Timer

var direction := -1
var atacando: bool
var vida: int = VIDA_MAX
var controle: bool = false
var is_dead: bool = false
var levando_dano: bool = false

func _physics_process(delta: float) -> void:
	if is_dead or levando_dano:
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if wall_detector.is_colliding():
		direction *= -1 
		wall_detector.scale.x *= -1
		flip()

		
	if direction and not atacando:
		velocity.x = direction * SPEED * delta
		animation.play("walk")
	
	move_and_slide()
	

func flip():
	if velocity.x > 0:
		texture.flip_h = false
	if velocity.x < 0:
		texture.flip_h = true

func _on_atkarea_body_entered(body):
	if body.is_in_group("player"):
		atacando = true
		animation.play("attack")
		body.take_damage(DANO)

func _on_atkarea_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		atacando = false
		animation.play("walk")
		print("2")

func _on_anim_animation_finished(anim_name):
	if is_dead:
		queue_free()
		return

	if anim_name == "attack":
		if atacando:
			animation.play("attack")
		else:
			animation.play("walk")
	elif anim_name == "hit":
		levando_dano = false
		if atacando:
			animation.play("attack")
		else:
			animation.play("walk")

func take_damage(amount: int):
	if is_dead:
		return
	vida -= amount
	if vida == 0:
		die()
	else:
		levando_dano = true
		animation.play("hit")

func die():
	is_dead = true
	animation.play("death")
	velocity = Vector2.ZERO

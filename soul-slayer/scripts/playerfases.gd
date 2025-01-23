extends CharacterBody2D

@export var vida_max = 6
@export var DANO = 1

const SPEED = 130.0
const JUMP_FORCE = -320.0
var is_jumping := false
var direction : float
var atacando : bool
var vida: int = vida_max
var is_dead: bool = false
var levando_dano: bool = false
const NUMERO_COLISION = 15
var morte: bool = false

@onready var camera := $Camera2D
@onready var animation := $AnimatedSprite as AnimationPlayer
@onready var sprite := $texture as Sprite2D
@onready var timer := $Timer
@onready var timer2 := $Timer2
@onready var atk_area := $atkarea as Area2D
@onready var jumpS := $AudioStreamPlayer2D
@onready var atck := $AudioStreamPlayer2D2

func _ready():
	timer2.start() # tempo de 5s

func saude_controle():
	if vida == 6:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
	if vida == 5:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = false
	if vida == 4:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
	if vida == 3:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
	if vida == 2:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
	if vida == 1:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = false
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
	if vida <= 0:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = false
		$CanvasLayer/Sprite2D3.visible = false
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false

func _process(delta):
	if is_dead:
		return
	animate()
	flip()
	saude_controle()

func animate():
	if is_dead:
		animation.play("death")
		return
	if levando_dano:
		animation.play("hit")
		return
	if atacando:
		animation.play("ataque")
		return
	
	if velocity.y < 0 and not is_on_floor():
		animation.play("jump")
	
	if velocity.x != 0:
		animation.play("walk")
	
	if velocity.x == 0:
		animation.play("idle")

func flip():
	if velocity.x > 0:
		sprite.flip_h = true
		$atkarea/atkcolision.position.x = NUMERO_COLISION
	if velocity.x < 0:
		sprite.flip_h = false
		$atkarea/atkcolision.position.x = -NUMERO_COLISION

func _physics_process(delta):
	gravidade(delta)
	mover()

func mover():
	velocity.x = direction * SPEED
	move_and_slide()
	
	if morte:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			jumpS.play()
			jump()
		direction = Input.get_axis("esquerda", "direita")	
	
	if atacando:
		direction
	
	if Input.is_action_pressed('ataque'):
		ataque()

func gravidade(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta

func jump():
	velocity.y = JUMP_FORCE

func ataque():
	atck.play()
	atacando = true

func take_damage(amount: int):
	if is_dead:
		return
	vida -= amount
	if vida <= 0:
		morte = false
		saude_controle()
		die()
	else:
		levando_dano = true
		animation.play("hit")

func _on_animated_sprite_animation_finished(anim_name):
	if anim_name == "ataque":
		atacando = false 
	if anim_name == "death":
		morte = false
		timer.start()
	if anim_name == "hit":
		levando_dano = false

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() # Replace with function body.

func die():
	is_dead = true
	direction = 0
	velocity = Vector2.ZERO
	morte = false
	animation.play("death")
	print(morte)

func _on_atkarea_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigo") and atacando:
		body.take_damage(DANO)

func _on_timer_2_timeout():
	morte = true

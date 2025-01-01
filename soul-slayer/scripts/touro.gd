extends CharacterBody2D

const VIDA_MAX = 18
const SPEED = 100.0
var SPEED2 = 680.0
const JUMP_VELOCITY = -400.0
const DANO = 3

@export var magnitude: float = 10.0
@onready var wall_detector := $wallD as RayCast2D
@onready var areia_scene = preload("res://actors/areia.tscn") 
@onready var areia_scene2 = preload("res://actors/areia_e.tscn") 
@onready var areia_scene3 = preload("res://actors/areia_e_2.tscn") 
@onready var animation := $animTouro as AnimationPlayer
@onready var texture := $texture as Sprite2D
@onready var colison: CollisionShape2D = $Area2D/CollisionShape2D
@onready var timer := $Timer
@onready var timer2 := $Timer2
@onready var timer3 := $Timer3
@onready var timer4 := $Timer4
@onready var timer5 := $Timer5
@onready var timer6 := $Timer6
@onready var timer7 := $Timer7
@onready var animareia := $animareia as AnimationPlayer

var dfase: bool =  true
var primeiro = false
var vida: int = VIDA_MAX
var is_dead: bool = false
var levando_dano: bool = false
var atacando: bool
var N_A = 0
var controlador = 0
var direction := -1
var corre: bool
var fase2: bool = false
var idle: = false
var shake : Vector2 = Vector2.ZERO

func _ready():
	animation.play("abertura")

func _process(delta):
	saude_controle()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()


func take_damage(amount: int):
	if is_dead:
		return
	vida -= amount
	if vida == 0:
		die()
	else:
		print(vida)

func saude_controle():
	if vida == 18:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = true
		$CanvasLayer/Sprite2D16.visible = true
		$CanvasLayer/Sprite2D17.visible = true
		$CanvasLayer/Sprite2D18.visible = true
		$CanvasLayer/Sprite2D19.visible = true
	if vida == 17:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = true
		$CanvasLayer/Sprite2D16.visible = true
		$CanvasLayer/Sprite2D17.visible = true
		$CanvasLayer/Sprite2D18.visible = true
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 16:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = true
		$CanvasLayer/Sprite2D16.visible = true
		$CanvasLayer/Sprite2D17.visible = true
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 15:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = true
		$CanvasLayer/Sprite2D16.visible = true
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 14:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = true
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 13:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = true
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 12:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = true
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 11:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = true
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 10:
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = true
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 9:
		if dfase:
			fase2 = true
		else:
			pass
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = true
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
		
	if vida == 8:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = true
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 7:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = true
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 6:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = true
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 5:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = true
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 4:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = true
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 3:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = true
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 2:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = true
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 1:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = true
		$CanvasLayer/Sprite2D3.visible = false
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false
	if vida == 0:
		
		$CanvasLayer/Sprite2D.visible = true
		$CanvasLayer/Sprite2D2.visible = false
		$CanvasLayer/Sprite2D3.visible = false
		$CanvasLayer/Sprite2D4.visible = false
		$CanvasLayer/Sprite2D5.visible = false
		$CanvasLayer/Sprite2D6.visible = false
		$CanvasLayer/Sprite2D7.visible = false
		$CanvasLayer/Sprite2D8.visible = false
		$CanvasLayer/Sprite2D9.visible = false
		$CanvasLayer/Sprite2D10.visible = false
		$CanvasLayer/Sprite2D11.visible = false
		$CanvasLayer/Sprite2D12.visible = false
		$CanvasLayer/Sprite2D13.visible = false
		$CanvasLayer/Sprite2D14.visible = false
		$CanvasLayer/Sprite2D15.visible = false
		$CanvasLayer/Sprite2D16.visible = false
		$CanvasLayer/Sprite2D17.visible = false
		$CanvasLayer/Sprite2D18.visible = false
		$CanvasLayer/Sprite2D19.visible = false

func die():
	is_dead = true
	animation.play("death")
	velocity = Vector2.ZERO

func _on_area_2d_body_entered(body: Node2D) -> void:
	direction = -1
	texture.flip_h = false
	if body.is_in_group("player"):
		atacando = true
		if primeiro:
			if N_A == 0 or N_A == 1: 
				if controlador == 0 or controlador == 2 or controlador == 3 or controlador == 6 :
					animation.play("ataque3")
					velocity = Vector2.ZERO
					N_A = N_A + 1
					controlador = controlador + 1
					timer2.start()
				elif controlador == 1 or controlador == 4 or controlador == 5 :
					animation.play("ataque")
					velocity = Vector2.ZERO
					N_A = N_A + 1
					controlador = controlador + 1
					timer4.start()
				if controlador == 7:
					controlador = 0
			else:
				corre = true
				if direction and corre:
					velocity.x = direction * SPEED
					velocity.y = direction * SPEED2
				animation.play("ataque2")
				timer3.start()
				N_A = 0
		else:
			pass

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		atacando = false

func _on_anim_touro_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ataque":
		if fase2:
			animation.play("fase2")
		else: 
			if atacando:
				animation.play("ataque")
			else:
				if idle:
					animation.play("idle2")
				else:
					animation.play("idle")
	if anim_name == "ataque2":
		corre = false
		if fase2:
			animation.play("fase2")
		else: 
			if atacando:
				animation.play("ataque")
			else:
				if idle:
					animation.play("idle2")
				else:
					animation.play("idle")
	if anim_name == "ataque3":
		corre = false
		if fase2:
			animation.play("fase2")
		else: 
			if atacando:
				animation.play("ataque")
			else:
				if idle:
					animation.play("idle2")
				else:
					animation.play("idle")
	if anim_name == "fase2":
		fase2 = false
		dfase = false
		corre = false
		idle = true
		animation.play("idle2")
	if anim_name == "abertura":
		primeiro = true
		animation.play("idle")
	if anim_name == "death":
		is_dead = true
		animation.play("soul")
	if anim_name == "soul":
		animation.play("soulP")
		timer.start()

func _on_timer_timeout() -> void:
	atacando = false

func _on_timer_2_timeout():
	if idle:
		var areia_instance = areia_scene.instantiate()
		add_child(areia_instance)
		timer5.start()
	else:
		var areia_instance = areia_scene.instantiate()
		add_child(areia_instance)

func _on_timer_3_timeout():
	if idle:
		var areia_instance = areia_scene.instantiate()
		add_child(areia_instance)
		var areia_instance2 = areia_scene2.instantiate()
		add_child(areia_instance2)
	else:
		var areia_instance = areia_scene.instantiate()
		add_child(areia_instance)
		#shake = Vector2(randf_range(-1,1), randf_range(-1,1)) * magnitude

func _on_timer_4_timeout():
	if idle:
		var areia_instance = areia_scene2.instantiate()
		add_child(areia_instance)
		var areia_instance2 = areia_scene3.instantiate()
		add_child(areia_instance2)
	else:
		var areia_instance = areia_scene2.instantiate()
		add_child(areia_instance)

func _on_area_2d_2_body_entered(body):
	direction = 1
	texture.flip_h = true
	if body.is_in_group("player"):
		atacando = true
		
		if N_A == 0 or N_A == 1: 
			if controlador == 0 or controlador == 2 or controlador == 3 or controlador == 6 :
				animation.play("ataque3")
				velocity = Vector2.ZERO
				timer2.start()
				N_A = N_A + 1
				controlador = controlador + 1
			elif controlador == 1 or controlador == 4 or controlador == 5 :
				animation.play("ataque")
				velocity = Vector2.ZERO
				N_A = N_A + 1
				controlador = controlador + 1
				timer4.start()
			if controlador == 7:
				controlador = 0
		else:
			corre = true
			if direction and corre:
				velocity.x = direction * SPEED
				velocity.y = -direction * SPEED2
			animation.play("ataque2")
			timer3.start()
			N_A = 0

func _on_area_2d_2_body_exited(body):
	if body.is_in_group("player"):
		atacando = false

func _on_area_2d_3_body_entered(body):
	if body.is_in_group("player"):
		if is_dead:
			get_tree().change_scene_to_file("res://levels/final.tscn")
		else:
			body.take_damage(DANO)

func _on_timer_5_timeout():
	var areia_instance = areia_scene.instantiate()
	add_child(areia_instance)

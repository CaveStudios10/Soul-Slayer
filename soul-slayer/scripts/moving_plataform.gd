extends Node2D

const WAIT_DURATION := 2.0

@onready var plataforma := $plataforma as AnimatableBody2D
@export var move_speed := 3.0
@export var distance := 192
@export var move_horizontal := true

var folow := Vector2.ZERO
var plataforma_center := 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_plataforma()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	plataforma.position = plataforma.position.lerp(folow, 0.5)

func move_plataforma():
	var move_direction = Vector2.LEFT * distance if move_horizontal else Vector2.UP * distance
	var duration = move_direction.length() / float(move_speed * plataforma_center)
	
	var plataforma_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	plataforma_tween.tween_property(self, "folow", move_direction, duration).set_delay(WAIT_DURATION)
	plataforma_tween.tween_property(self, "folow",Vector2.ZERO, duration).set_delay(WAIT_DURATION)
	

extends Control

@onready var animation = $AnimatedSprite2D
@onready var animationP = $AnimationPlayer
@onready var timer = $Timer
@onready var timer2 = $Timer2

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.visible = false
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	animation.visible = true
	animation.play("default")

func _on_animated_sprite_2d_animation_finished():
	animation.play("raiva")
	timer2.start()


func _on_timer_2_timeout():
	animation.visible = false

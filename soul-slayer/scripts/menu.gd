extends Control

@onready var musica := $menuMusica as AudioStreamPlayer
@onready var click = $click

func _ready() -> void:
	self.set_process(true)
	self.owner = null

func _process(delta):
	pass



func _on_play_pressed():
	get_tree().change_scene_to_file("res://levels/fase_empresa.tscn")
	add_child(musica)
	click.play()


func _on_control_pressed():
	get_tree().change_scene_to_file("res://levels/controle.tscn")
	click.play()


func _on_quit_pressed():
	click.play()
	get_tree().quit()

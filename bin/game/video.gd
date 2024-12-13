extends Node2D

@onready var Game = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("init")
	pass # Replace with function body.

func changePj():
	$personaje.hide()
	$Node2D.show()
	$Node2D/personaje2.play("default")
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Game.initGame()
	self.queue_free()
	pass # Replace with function body.

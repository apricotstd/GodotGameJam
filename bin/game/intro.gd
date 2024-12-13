extends Node

func _ready() -> void:
	$intro/intro.play("intro")
	$intro/init.play("init")
	pass 


func closePersonaje():
	$intro/intro.hide()
	pass

func showPersonaje():
	$intro/intro.show()
	pass

func _on_init_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://bin/game/game_lvl_1.tscn")
	pass # Replace with function body.

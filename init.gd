extends Control

func _ready() -> void:
	$Timer.start()
	pass

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://bin/views/menu/menu.tscn")
	pass # Replace with function body.

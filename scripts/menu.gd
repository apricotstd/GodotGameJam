extends CanvasLayer

var option = "res://bin/views/option/option1.tscn"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_option_pressed():
	sounButom()
	await get_tree().create_timer(1).timeout 
	get_tree().change_scene_to_file(option)
	pass # Replace with function body.


func _on_texture_button_3_pressed() -> void: 
	sounButom()
	await get_tree().create_timer(1).timeout 
	get_tree().quit()
	pass # Replace with function body.


func _on_texture_button_1_pressed() -> void:
	sounButom()
	await get_tree().create_timer(1).timeout 
	get_tree().change_scene_to_file("res://bin/game/intro.tscn")
	pass # Replace with function body.
 
func sounButom():
	$Node/SoundBotones.play()
	pass

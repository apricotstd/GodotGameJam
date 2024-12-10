extends CanvasLayer
var option = "res://bin/views/option/option1.tscn"
@onready var soundBotones = $Node/SoundBotones
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_option_pressed():
	_on_sound_botones_finished()
	get_tree().change_scene_to_file(option)
	pass # Replace with function body.


func _on_texture_button_3_pressed():
	_on_sound_botones_finished()
	get_tree().quit()
	pass # Replace with function body.


func _on_texture_button_1_pressed() -> void:
	_on_sound_botones_finished()
	get_tree().change_scene_to_file("res://bin/game/game_lvl_1.tscn")
	pass # Replace with function body.


func _on_sound_botones_finished() -> void:
	soundBotones.play()
	pass # Replace with function body.

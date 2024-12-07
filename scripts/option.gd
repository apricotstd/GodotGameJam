extends Control
var back = "res://bin/views/menu/menu.tscn"
var op1 = "res://bin/views/option/option1.tscn"
var op2 = "res://bin/views/option/option2.tscn"
var op3 = "res://bin/views/option/option3.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	get_tree().change_scene_to_file(back)
	pass # Replace with function body.


func _on_texture_button_1_pressed():
	get_tree().change_scene_to_file(op1)
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file(op2)
	pass # Replace with function body.


func _on_texture_button_3_pressed():
	get_tree().change_scene_to_file(op3)
	pass # Replace with function body.

extends Control

var back = "res://bin/views/menu/menu.tscn"
var op1 = "res://bin/views/option/option1.tscn"
var op2 = "res://bin/views/option/option2.tscn"
var op3 = "res://bin/views/option/option3.tscn"
var volumenM = 1 
# Llamado cuando el nodo entra en el árbol de la escena por primera vez.
func _ready():
	pass  # Reemplaza con el cuerpo de la función.

# Llamado en cada cuadro. 'delta' es el tiempo transcurrido desde el cuadro anterior.
func _process(delta):
	pass

func _on_texture_button_pressed():
	get_tree().change_scene_to_file(back)

func _on_texture_button_1_pressed():
	get_tree().change_scene_to_file(op1)

func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file(op2)

func _on_texture_button_3_pressed():
	get_tree().change_scene_to_file(op3)

func _on_control_musica_value_changed(value: float) -> void:
	volumenM = value
	print("VolumenM actualizado a: ", volumenM)  
	volumenMusica(0, value)

func volumenMusica(bus_index, value: float) -> void:
	value = clamp(value, 0, 100)
	actualizar_label(value)
	if value == 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, value)

# Función para actualizar el texto del Label
func actualizar_label(value: float) -> void:
	$TextureRect/SoundControl/TextureButtonMusica/TextureButton6/Label.text = str(value)
	print("Label actualizado a: ", str(value))  #

extends CanvasLayer

var elapsed_time: int = 0 
var timer_started: bool = false
var  volumenM = 1
@onready var time = $Time

func _ready():
	elapsed_time = 0
	$Timer.start()
	timer_started = true
	set_process_unhandled_input(true) 
	process_mode = Node.PROCESS_MODE_ALWAYS

func _stop_timer(): 
	timer_started = false 

func _on_timer_timeout() -> void:
	if timer_started: 
		elapsed_time += 1 
		update_timer_label()

func update_timer_label():
	var minutes = int(elapsed_time) / 60 
	var seconds = int(elapsed_time) % 60
	print(minutes, " ", seconds)
	time.text = "%02d:%02d" % [minutes, seconds] 

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed: 
		if event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			if !get_tree().paused:
				get_tree().paused = true
				$Paused.show()
			else:
				_on_continue_pressed()
	pass
	
func dead():
	$Dead.show()
	get_tree().paused = true
	await get_tree().create_timer(2).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://bin/views/menu/menu.tscn")
	pass

func _on_quitar_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://bin/views/menu/menu.tscn")
	pass # Replace with function body.

func _on_continue_pressed() -> void:
	get_tree().paused = false
	$Paused.hide()
	pass # Replace with function body.


func _on_opciones_2_pressed() -> void:
	$Paused.hide()
	get_tree().paused = true
	$Opciones.show()
	pass # Replace with function body.


func _on_return_pressed() -> void:
	$Opciones.hide()
	get_tree().paused = true
	$Paused.show()
	pass # Replace with function body.


func _on_texture_button_2_pressed() -> void:
	$Opciones/Control_opciones/KeysControl.hide()
	$Opciones/Control_opciones/SoundButton.show()
	$Opciones/Control_opciones/LenguajeButton.hide()
	pass # Replace with function body.

func _on_button_control_pressed() -> void:
	$Opciones/Control_opciones/Configuraciones/KeysButton.show()
	$Opciones/Control_opciones/Configuraciones/SoundControl.hide()
	$Opciones/Control_opciones/Configuraciones/ControlLenguaje.hide()
	pass # Replace with function body.


func _on_button_sonido_pressed() -> void:
	$Opciones/Control_opciones/Configuraciones/KeysButton.hide()
	$Opciones/Control_opciones/Configuraciones/SoundControl.show()
	$Opciones/Control_opciones/Configuraciones/ControlLenguaje.hide()
	
	
	pass # Replace with function body.


func _on_button_lenguaje_pressed() -> void:
	$Opciones/Control_opciones/Configuraciones/KeysButton.hide()
	$Opciones/Control_opciones/Configuraciones/SoundControl.hide()
	$Opciones/Control_opciones/Configuraciones/ControlLenguaje.show()
	pass # Replace with function body.


	
func _on_control_musica_value_changed(value: float) -> void:
	volumenM = value
	print("VolumenM actualizado a: ", volumenM)  
	volumenMusica(0, value)

func volumenMusica(bus_index, value: float) -> void:
	value = clamp(value, 0, 15)
	actualizar_label(value)
	if value == 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, value)

# Función para actualizar el texto del Label
func actualizar_label(value: float) -> void:
	$Opciones/Control_opciones/Configuraciones/SoundControl/TextureButtonMusica/TextureButton6/Label.text = str(value)
	print("Label actualizado a: ", str(value))  #
	

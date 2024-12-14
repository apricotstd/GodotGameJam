extends CanvasLayer

var elapsed_time: int = 0 
var timer_started: bool = false

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

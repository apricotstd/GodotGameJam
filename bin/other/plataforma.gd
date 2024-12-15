extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direcciones = []
var pos = 0

func _ready() -> void:
	set_physics_process(false)
	if is_instance_valid(get_parent().get_node("GroupDirection")):
		direcciones = get_parent().get_node("GroupDirection").get_children()
		set_physics_process(true)
	pass

func _physics_process(delta: float) -> void:
	if pos < direcciones.size():
		var direction = (direcciones[pos].global_position - global_position).normalized()
		velocity = direction * SPEED
		if global_position.distance_to(direcciones[pos].global_position) < 50:
			pos+=1
	elif direcciones.size() > 0:
		pos = 0
	move_and_slide()

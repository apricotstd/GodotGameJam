extends CharacterBody2D

@export var duration = 10
var direcciones = []
var pos = 0

func _ready() -> void:
	set_physics_process(false)
	if is_instance_valid(get_parent().get_node("GroupDirection")):
		direcciones = get_parent().get_node("GroupDirection").get_children()
		start_tween()
	pass

func start_tween():
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	for x in direcciones:
		tween.tween_property(self, "global_position", x.global_position, duration / 2)

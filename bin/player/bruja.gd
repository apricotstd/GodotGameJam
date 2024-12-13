extends Area2D

var eje = "x"

# Called when the node enters the scene tree for the first time.
func emit_song() -> void:
	$sonidp.play()

func changeEje(ej):
	eje = ej
	pass

func _process(delta: float) -> void:
	if self.visible:
		if eje == "x":
			self.global_position.x += 2
		else:
			self.global_position.x -= 2
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.dead()
	pass # Replace with function body.

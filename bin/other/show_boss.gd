extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if is_instance_valid(Gl.bruja):
			Gl.bruja.transporte(self.global_position)
	pass # Replace with function body.

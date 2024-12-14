extends Sprite2D

func _on_subir_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.showX("'X' Subir")
	pass # Replace with function body.

func _on_bajar_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.showX("'X' Bajar")
	pass # Replace with function body.

func _on_subir_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hideX()
	pass # Replace with function body.

func _on_bajar_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hideX()
	pass # Replace with function body.

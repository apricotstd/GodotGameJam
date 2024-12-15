extends Sprite2D

var isVisible = null

func _on_subir_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.showX("'X' Subir")
		isVisible = "top"
	pass # Replace with function body.

func _on_bajar_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.showX("'X' Bajar")
		isVisible = "down"
	pass # Replace with function body.

func _on_subir_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hideX()
		isVisible = null
	pass # Replace with function body.

func _on_bajar_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hideX()
		isVisible = null
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed: 
		if event.keycode == KEY_X:
			if isVisible == "top":
				$pie/CollisionShape2D.disabled = false
				Gl.player.animateUp(isVisible, $Marker2D)
			elif isVisible == "down":
				Gl.player.animateUp(isVisible, $Marker2D2)
				$pie/CollisionShape2D.disabled = true
			pass
	pass

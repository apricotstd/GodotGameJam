extends Node2D

var player = "res://bin/player/player.tscn"
@onready var bruja = $Node2D/Bruja

func initGame():
	addPlayer()
	bruja.show()
	bruja.emit_song()
	pass

func addPlayer():
	var pj = load(player).instantiate()
	$positionPJ.add_child(pj)
	pass

func _on_cahnge_positio_bruja_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		bruja.global_position = $Node2D/CahngePositioBruja.global_position
		$Node2D/CahngePositioBruja.queue_free()
		bruja.global_position.x += 400
		bruja.global_position.y -= 400
		bruja.changeEje("y")
	pass # Replace with function body.

func _on_cahnge_positio_bruja_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		bruja.global_position = $Node2D/CahngePositioBruja3.global_position
		$Node2D/CahngePositioBruja3.queue_free()
		bruja.global_position.x -= 400
		bruja.global_position.y -= 400
		bruja.changeEje("x")
	pass # Replace with function body.

func _on_cahnge_positio_bruja_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		bruja.global_position = $Node2D/CahngePositioBruja2.global_position
		$Node2D/CahngePositioBruja2.queue_free()
		bruja.global_position.x += 400
		bruja.global_position.y -= 400
		bruja.changeEje("y")
	pass # Replace with function body.

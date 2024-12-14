extends Area2D

var eje = "x"

var mensajesBruja = [
	"estoy cerca niña",
	"te estoy siguiendo",
	"seras mia"
]

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

func _on_visible_screen_entered() -> void:
	$Label.text = mensajesBruja[randi_range(0, mensajesBruja.size() - 1) ]
	$Label.show()
	pass # Replace with function body.

func _on_visible_screen_exited() -> void:
	$Label.hide()
	pass # Replace with function body.

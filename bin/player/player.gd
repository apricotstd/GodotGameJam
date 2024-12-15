extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

@onready var sprite = $Col/Imgs

var state = 0
var target = null

func _ready() -> void:
	Gl.player = self
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and state == 0:
		velocity += get_gravity() * delta
		
	if state == 0 or state == 3:
		# Handle jump.
		if Input.is_action_just_pressed("ui_up") and (is_on_floor() or state == 3):
			state = 0
			velocity.y = JUMP_VELOCITY
			
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			if direction == 1:
				sprite.flip_h = false
			else:
				sprite.flip_h = true
			sprite.play("move")
			velocity.x = direction * SPEED
		else:
			sprite.flip_h = false
			sprite.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	elif state == 1 or state == 2:
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * SPEED
		if global_position.distance_to(target.global_position) < 50:
			state = 0
			target = null
		else:
			sprite.play("subir")
	move_and_slide()

func dead():
	$Camera2D/Game.dead()
	pass

func showX(txt):
	$Label.text = txt
	$Label.show()
	pass

func hideX():
	$Label.text = ""
	$Label.hide()
	pass

func animateUp(v, ob):
	if state == 0:
		if v == "top":
			state = 1
			target = ob
		elif v == "down":
			state = 2
			target = ob
	pass

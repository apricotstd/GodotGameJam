extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

@onready var sprite = $Col/Imgs

func _ready() -> void:
	Gl.player = self
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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

	move_and_slide()

func dead():
	$Camera2D/Game.dead()
	pass

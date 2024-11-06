extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 900.0  # Gravity only affects the Y-axis

func _physics_process(delta: float) -> void:
	# Apply gravity to the Y-axis only if the character is not on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input for horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED  # Apply horizontal movement

	# Use move_and_slide() to handle movement and collisions
	move_and_slide()

extends CharacterBody2D

@export var speed: float = 400.0
@export var jump_velocity: float = -500.0
@export var acceleration: float = 2000.0
@export var friction: float = 1800.0

func _physics_process(delta: float) -> void:
	# الجاذبية
	if not is_on_floor():
		velocity += get_gravity() * delta

	# القفز - just_pressed عشان تحصل مرة واحدة بس
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# الحركة
	var direction = Input.get_axis("move_left", "move_right")

	# تطبيق الحركة
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	move_and_slide()

extends CharacterBody2D



@export var speed: float = 400.0
@export var jump_velocity: float = -500.0
@export var acceleration: float = 2000.0
@export var friction: float = 1800.0

func _physics_process(delta: float) -> void:
	# الجاذبية
	if not is_on_floor():
		velocity += get_gravity() * delta

	# القفز بالـ W
	if Input.is_physical_key_pressed(KEY_W) and is_on_floor():
		velocity.y = jump_velocity

	# الحركة بـ A و D
	var direction = 0
	if Input.is_physical_key_pressed(KEY_D):
		direction += 1
	if Input.is_physical_key_pressed(KEY_A):
		direction -= 1
	
	# تطبيق الحركة
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	move_and_slide()

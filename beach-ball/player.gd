extends CharacterBody2D






@export var speed: float = 400.0
@export var jump_velocity: float = -500.0
@export var acceleration: float = 2000.0
@export var friction: float = 1800.0

func _physics_process(delta: float) -> void:
	# الجاذبية
	if not is_on_floor():
		velocity += get_gravity() * delta

	# القفز (استخدام ضغطة واحدة فقط)
	if Input.is_physical_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = jump_velocity

	# حساب الاتجاه يدوياً
	var direction = 0
	if Input.is_physical_key_pressed(KEY_RIGHT):
		direction += 1
	if Input.is_physical_key_pressed(KEY_LEFT):
		direction -= 1
	
	# تطبيق الحركة
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	move_and_slide()

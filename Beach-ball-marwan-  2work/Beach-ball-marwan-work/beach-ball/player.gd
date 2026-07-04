extends CharacterBody2D

@export var speed: float = 400.0
@export var jump_velocity: float = -500.0
@export var acceleration: float = 2000.0
@export var friction: float = 1800.0

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _physics_process(delta: float) -> void:
	# الجاذبية
	if not is_on_floor():
		velocity += get_gravity() * delta

	# القفز
	if Input.is_action_just_pressed("jump_p") and is_on_floor():
		velocity.y = jump_velocity

	# الحركة
	var direction = Input.get_axis("move_left_p", "move_right_p")

	# تطبيق الحركة
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	# انيماشين - اتشيك بس على الحركة الأفقية
	if abs(velocity.x) > 0:
		animation_player.play("run")
	else:
		animation_player.play("idel")

	move_and_slide()

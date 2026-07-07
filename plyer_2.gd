extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_velocity: float = -500.0
@export var acceleration: float = 2000.0
@export var friction: float = 1800.0

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# الجاذبية
	if not is_on_floor():
		velocity.y += gravity * delta

	# القفز
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)

	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	



		

	# انيماشين - اتشيك بس على الحركة الأفقية
	if abs(velocity.x) > 0:
		animation_player.play("run-2")
	else:
		animation_player.play("idle-2")

	move_and_slide()

	

extends RigidBody2D





var is_game_started = false
@export var speed = 300

func _ready():
	# منع الكرة من الدوران حول نفسها
	lock_rotation = true
	# تجميد الكرة في البداية لكي لا تسقط أو تتحرك
	freeze = true 

func _input(event):
	# بداية اللعبة عند الضغط على أي زر
	if event.is_pressed() and not is_game_started:
		start_game()

func start_game():
	is_game_started = true
	# فك التجميد لتبدأ الفيزياء بالعمل
	freeze = false 
	
	# اختيار اتجاه عشوائي لليسار أو اليمين لتجنب الذهاب لجهة واحدة
	# randf_range تعطينا قيمة عشوائية بين سالب السرعة وموجب السرعة
	var random_x = randf_range(-speed, speed)
	
	# تطبيق السرعة (الكرة ستتحرك في X بشكل عشوائي وY بسرعة ثابتة للأسفل)
	linear_velocity = Vector2(random_x, speed)

# نصيحة إضافية: إذا كانت الكرة تتأثر بالجاذبية بشكل مزعج، 
# يمكنك إضافة السطر التالي في الـ _ready:
# gravity_scale = 0

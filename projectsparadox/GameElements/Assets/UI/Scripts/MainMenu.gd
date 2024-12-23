extends Control

@onready var panel = $Panel_1
@onready var style_list = [
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu4.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu2.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu3.tres")
]

@onready var SFX =$AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create and configure the Timer node
	if Global.CheckIfExit:
		SFX.play()
		Global.CheckIfExit=false
	MasterAudioForthemenues.play_music_level()
	var timer = Timer.new()
	timer.wait_time = 3.1 
	add_child(timer)  
	print("starting")
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	timer.start()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print("....")
	

func _on_timer_timeout():
	
	print("interd")
	var rng = RandomNumberGenerator.new()
	var num1 = rng.randi_range(0, 3)
	while (Global.index==num1):
		num1 = rng.randi_range(0, 3)
	
	print(num1)
	print(style_list[num1])
	var new_texture = style_list[num1] as StyleBoxTexture
	var new_style = StyleBoxTexture.new()
	new_style.texture = new_texture
	panel.add_theme_stylebox_override("panel", new_texture)
	Global.index = num1
	
	var new_timer = Timer.new()
	new_timer.wait_time = 0.2  
	new_timer.one_shot = true
	add_child(new_timer)  
	print("starting")
	new_timer.timeout.connect(Callable(self, "_on_new_timer_timeout"))
	new_timer.start()
	
func _on_new_timer_timeout():
		Global.visible=false
		$ShakeRect.visible=Global.visible

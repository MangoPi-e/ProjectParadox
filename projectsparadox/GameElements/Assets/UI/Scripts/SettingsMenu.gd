extends Node
@onready var panel = $Panel_1
@onready var style_list = [
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu4.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu2.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu3.tres")
]
@onready var resolutions = {
	"720p (HD)": Vector2i(1280, 720),
	"1080p (Full HD)": Vector2i(1920, 1080)
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create and configure the Timer node
	var new_texture = style_list[Global.index] as StyleBoxTexture
	var new_style = StyleBoxTexture.new()
	new_style.texture = new_texture 
	panel.add_theme_stylebox_override("panel", new_texture)
	var timer = Timer.new()
	timer.wait_time = 3.0  
	add_child(timer)  
	print("starting")
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	timer.start()
	# Set the default selected resolution as a placeholder
	var current_size = DisplayServer.window_get_size()
	for index in range(resolutions.size()):
		if resolutions.values()[index] == current_size:
			if $VBoxContainer/OptionButton:
				$VBoxContainer/OptionButton.selected = index
				break
			else:
				print("OptionButton not found!")

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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

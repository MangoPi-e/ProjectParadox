extends Control

@onready var panel = $PanelContainer/Panel_2
@onready var style_list = [
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu4.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu2.tres"),
	preload("res://GameElements/Assets/UI/menues/stayles/main_menu3.tres")
]
# Called when the node enters the scene tree for the first time.

func _ready():
	$AnimationPlayer.play("RESET")
	var timer = Timer.new()
	timer.wait_time = 3.1 
	add_child(timer)  
	
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	timer.start()
	
func _on_timer_timeout():
	
	
	var rng = RandomNumberGenerator.new()
	var num1 = rng.randi_range(0, 3)
	while (Global.indexPause==num1):
		num1 = rng.randi_range(0, 3)
	
	
	var new_texture = style_list[num1] as StyleBoxTexture
	var new_style = StyleBoxTexture.new()
	new_style.texture = new_texture
	panel.add_theme_stylebox_override("panel", new_texture)
	Global.indexPause = num1
	
	var new_timer = Timer.new()
	new_timer.wait_time = 0.2  
	new_timer.one_shot = true
	add_child(new_timer)  
	print("starting")
	new_timer.timeout.connect(Callable(self, "_on_new_timer_timeout"))
	new_timer.start()
	
func _on_new_timer_timeout():
		Global.visible=false
		$PanelContainer/ShakeRect.visible=Global.visible
	

	
func _process(delta):
	testEsc()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pause menu")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("pause menu")
	
func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		visible = true
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		visible = false
		resume()
	

func _on_button_pressed() -> void:
	resume()


func _on_button_2_pressed() -> void:
	get_tree().paused = false
	Global.change_the_scene("res://GameElements/Assets/UI/menues/main_menu.tscn")

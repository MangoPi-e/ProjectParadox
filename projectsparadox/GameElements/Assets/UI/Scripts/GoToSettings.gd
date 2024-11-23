extends Button

@onready var SFX =$AudioStreamPlayer2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sfx_finished() -> void:
	get_tree().change_scene_to_file("res://GameElements/Assets/UI/menues/setting menu.tscn")

func _on_pressed() -> void:
	if SFX:
		print("SFX")
		SFX.play()
		await _on_sfx_finished()



func _on_mouse_entered():
	# Change button style when the mouse hovers over it
	var tween = create_tween()
	modulate = Color(0.6, 1, 0.0)  # Light red tint
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)

func _on_mouse_exited():
	# Reset button style when the mouse leaves
	var tween = create_tween()
	modulate = Color(1, 1, 1)  # Default white tint
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.2)

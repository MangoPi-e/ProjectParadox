extends CheckButton 




func _ready() -> void:
	self.button_pressed = Global.toggle



func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Global.toggle=true
		DisplayServer.window_set_mode(3,0)
		self.toggle_mode = Global.toggle
	else:
		DisplayServer.window_set_mode(0,0)
		self.toggle_mode = Global.toggle
	

extends CheckButton 








func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(3,0)
	else:
		DisplayServer.window_set_mode(0,0)

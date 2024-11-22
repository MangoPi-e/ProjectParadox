extends Lock

func _on_button_down() -> void:
	if Enabled:
		lock_open_sequence(check_for_keys())

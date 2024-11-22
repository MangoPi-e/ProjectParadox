extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	# Assuming you have a Checkbox node named "MuteCheckbox"
	self.connect("toggled", Callable(self, "_on_mute_checkbox_toggled"))

func _on_mute_checkbox_toggled(checked: bool):
	print("NO")
	var master_index = AudioServer.get_bus_index("Master")
	if checked:
		# Mute
		AudioServer.set_bus_volume_db(master_index, -80)
	else:
		# Unmute
		AudioServer.set_bus_volume_db(master_index, SoundManager.Mvolum)

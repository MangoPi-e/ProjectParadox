extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	# Assuming you have a Checkbox node named "MuteCheckbox"
	self.connect("toggled", Callable(self, "_on_mute_checkbox_toggled"))
	self.button_pressed = Global.toggle2

func _on_mute_checkbox_toggled(checked: bool):
	print("NO")
	var master_index = AudioServer.get_bus_index("Master")
	if checked:
		# Mute
		Global.toggle2=true
		AudioServer.set_bus_mute(master_index, true)
	else:
		# Unmute
		Global.toggle2=false
		AudioServer.set_bus_mute(master_index, false)
		AudioServer.set_bus_volume_db(master_index, SoundManager.Mvolum)

extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.value=SoundManager.Mvolum

func _value_changed(Value):
	if(value==-40):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-80)
		SoundManager.Mvolum = -80
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),Value)
		SoundManager.Mvolum = Value

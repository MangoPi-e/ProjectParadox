extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)

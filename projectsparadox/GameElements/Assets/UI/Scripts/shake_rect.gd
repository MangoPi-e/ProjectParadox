extends ColorRect


var TimeTracker = 0
var TimeOff = 2.75
var TimeOn = 3
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	TimeTracker += delta
	if TimeTracker >= 0.5:
		visible = false
	if TimeTracker >= TimeOn:
		TimeTracker = 0
	elif TimeTracker >= TimeOff:
		visible = true

	print(TimeTracker)

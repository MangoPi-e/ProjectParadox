extends ColorRect


var TimeTracker = 0
var TimeOff = 2.75
var TimeOn = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create and configure the Timer node
	var timer = Timer.new()
	timer.wait_time = 3.08 
	add_child(timer)  
	print("starting")
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	timer.start()
	visible = Global.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.


	print(TimeTracker)
func _on_timer_timeout():
	
	if Global.visible==false:
		Global.visible=true
		visible = Global.visible
	
	
	

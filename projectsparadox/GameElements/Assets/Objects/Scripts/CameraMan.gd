extends Camera2D

var PlayerObj: Player
var FollowThePlayer:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if FollowThePlayer:
		position = PlayerObj.position

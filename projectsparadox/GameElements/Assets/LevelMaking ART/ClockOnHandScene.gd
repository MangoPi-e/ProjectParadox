extends AnimatedSprite2D

@export var PlayerObject:Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not(is_playing()):
		PlayerObject.Enabled = true
		PlayerObject.CameraMan.FollowThePlayer = true

func lock_open_sequence():
	PlayerObject.Enabled = false
	PlayerObject.CameraMan.FollowThePlayer = false
	PlayerObject.CameraMan.position.x = -4024
	play("default")
	

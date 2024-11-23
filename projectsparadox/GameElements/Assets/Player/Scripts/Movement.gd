class_name MovementState
extends State

@export
var IdelState: State
var RunSpeed: float
var NormalSpeed: float
var MovementDir
var Sign = 1




func enter() -> void:
	super()

func process_physics(delta) -> State:
	if Input.is_action_pressed("Rush"):
		NormalSpeed = RunSpeed
	else:
		NormalSpeed = MovementSpeed
	MovementDir = Parent.MovementDir
	Parent.handle_movement(delta, NormalSpeed)
	if Input.is_action_just_pressed("Puse") and Parent.HaveTheClock:
		Parent.Enabled = false
		Parent.CameraMan.FollowThePlayer = false
		Parent.CameraMan.position.x = -4024
	if Input.is_action_just_pressed("Interact") and len(Parent.ObjectsInRange) > 0:
		Parent.ObjectsInRange[0].player_says_work()
		MovementDir = Vector2.ZERO
		
	if MovementDir == Vector2.ZERO:
		return IdelState
	return null

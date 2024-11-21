class_name MovementState
extends State

@export
var IdelState: State
@export
var RunSpeed: float = 100.0
var MomnSpeed: float = MovementSpeed
var MovementDir
var Sign = 1




func enter() -> void:
	super()

func process_physics(delta) -> State:
	if Input.is_action_pressed("Rush"):
		MomnSpeed = RunSpeed
	else:
		MomnSpeed = MovementSpeed
	MovementDir = Parent.MovementDir
	if sign(MovementDir.x) == -Sign:
		Parent.scale.x *= -1
		Sign *= -1
	Parent.handle_movement(delta, MomnSpeed)
	
	if Input.is_action_just_pressed("Interact"):
		Parent.ObjectsInRange[0].player_says_work()
		MovementDir = Vector2.ZERO
		
	if MovementDir == Vector2.ZERO:
		return IdelState
	return null

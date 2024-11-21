extends State

@export
var MoveState: State

func enter() -> void:
	super()

func process_input(_event) -> State:
	if Input.is_action_just_pressed("Interact"):
		Parent.ObjectsInRange[0].player_says_work()
	if Vector2(Input.get_action_strength("AnalogRight") - Input.get_action_strength("AnalogLeft"),Input.get_action_strength("AnalogUp") - Input.get_action_strength("AnalogDown")) != Vector2.ZERO and Parent.Enabled:
		return MoveState
	return null
	

func _process(_delta: float) -> void:
	pass

extends State

@export
var MoveState: State

func enter() -> void:
	super()

func process_input(_event) -> State:
	if Input.is_action_just_pressed("Interact") and len(Parent.ObjectsInRange) > 0:
		Parent.ObjectsInRange[0].player_says_work()
	if Vector2(Input.get_action_strength("Right") - Input.get_action_strength("Left"),Input.get_action_strength("Up") - Input.get_action_strength("Down")) != Vector2.ZERO and Parent.Enabled:
		return MoveState
	return null
	

func _process(_delta: float) -> void:
	pass

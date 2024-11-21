extends State

@export
var MoveState: State

func enter() -> void:
	super()

func process_input(_event) -> State:
	if Input.is_action_just_pressed("INTERACT"):
		Parent.ObjectsInRange[0].player_says_work()
	if Vector2(Input.get_axis('LEFT', 'RIGHT'), Input.get_axis('UP', 'DOWN')) != Vector2.ZERO and Parent.Enabled:
		return MoveState
	return null
	

func _process(delta: float) -> void:
	if Global.InteractTime < Global.MaxInteractTime:
		Global.InteractTime += delta

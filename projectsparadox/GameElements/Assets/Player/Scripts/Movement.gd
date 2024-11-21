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
	if Global.InteractTime < Global.MaxInteractTime:
		Global.InteractTime += delta
	if Input.is_action_pressed("SHIFT"):
		MomnSpeed = RunSpeed
	else:
		MomnSpeed = MovementSpeed
	MovementDir = Parent.MovementDir
	if sign(MovementDir.x) == -Sign:
		Parent.scale.x *= -1
		Sign *= -1
	Parent.handle_movement(delta, MomnSpeed)
	
	if Input.is_action_just_pressed("INTERACT") and Global.InteractTime >= Global.MaxInteractTime:
		Global.InteractTime = 0
		if Parent.NPC and Parent.NPCEnabled:
			Parent.NPC.activate()
			Parent.NPCEnabled = false
			MovementDir = Vector2.ZERO
		else:	
			var StopFlag = false
			for ele in Parent.ObjectsInRange:
				ele.activate()
				StopFlag = true
			if StopFlag:
				MovementDir = Vector2.ZERO
		
	if MovementDir == Vector2.ZERO:
		return IdelState
	return null

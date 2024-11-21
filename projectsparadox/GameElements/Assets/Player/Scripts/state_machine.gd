extends Node


@export
var StartingState: State

var CurrState: State



func init(parent: Player) -> void:
	for Child in get_children():#Setting the player
		Child.Parent = parent
	change_state(StartingState)#Start Working



func change_state(NewState):
	if CurrState:
		CurrState.exit()
	CurrState = NewState
	CurrState.enter()



func process_physics(delta: float) -> void:
	var NewState = CurrState.process_physics(delta)
	if NewState:
		change_state(NewState)


func process_input(event: InputEvent) -> void:
	var NewState = CurrState.process_input(event)
	if NewState:
		change_state(NewState)

func process_frame(delta: float) -> void:
	var NewState = CurrState.process_frame(delta)
	if NewState:
		change_state(NewState)

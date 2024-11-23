class_name State
extends Node

@export
var AnimationName:String

@export
var MovementSpeed:float = 150

var Parent: Player


func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	var Mod
	if Parent.MovementDir.y < 0:
		Mod = "Up"
	elif Parent.MovementDir.y > 0:
		Mod = "Down"
	elif Parent.MovementDir.x < 0:
		Mod = "Left"
	elif Parent.MovementDir.x > 0:
		Mod = "Right"
	elif Parent.LastAnim:
		Mod = Parent.LastAnim
	else:
		Mod = "Down"
	Parent.LastAnim = Mod
	Parent.Anim.play(AnimationName+" "+Mod)
	return null

func process_physics(_delta: float) -> State:
	return null

func get_movement_input():
	return Parent.MovementDir

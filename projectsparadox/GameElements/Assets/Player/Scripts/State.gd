class_name State
extends Node

@export
var AnimationName:String

@export
var MovementSpeed:float = 150

var Parent: Player


func enter() -> void:
  Parent.Anim.play(AnimationName)

func exit() -> void:
  pass

func process_input(_event: InputEvent) -> State:
  return null

func process_frame(_delta: float) -> State:
  return null

func process_physics(_delta: float) -> State:
  return null

func get_movement_input():
  return Parent.MovementDir

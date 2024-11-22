extends Node2D

@export_category("Positions")
@export var PositionB:Vector2
@export var PositionA:Vector2
var CurrPosition:Vector2
func _ready() -> void:
	PositionA = position
	CurrPosition = position

func lock_open_sequence():
	CurrPosition = PositionB

func _physics_process(delta: float) -> void:
	position.x = move_toward(position.x, CurrPosition.x, delta)
	position.y = move_toward(position.y, CurrPosition.y, delta)

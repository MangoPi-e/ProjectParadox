extends Node2D

@export var TimesPositions:Array[Vector2]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.TimeTravel = 1
	Global.TimesPositions = TimesPositions


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

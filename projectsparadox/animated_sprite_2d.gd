extends AnimatedSprite2D

var TimeTrack = 0
@export var TimeNeeded = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = 19
	play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if TimeTrack < TimeNeeded:
		TimeTrack += delta
	else:
		Global.change_the_scene("res://GameElements/Assets/LevelMaking ART/LevelsProbs/phase_1.tscn")
	pass

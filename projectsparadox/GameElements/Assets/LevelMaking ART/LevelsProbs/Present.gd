extends Node2D

@onready var SFX =$AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SFX.play()
	MasterAudioForthemenues.stop_music() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
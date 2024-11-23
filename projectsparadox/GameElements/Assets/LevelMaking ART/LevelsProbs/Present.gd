extends Node2D

@onready var SFX =$AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Phase0.play_music_level()
	SFX.play()
	MasterAudioForthemenues.stop_music()
	MasterAudioForthemenues._play_music(Global.Musics[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

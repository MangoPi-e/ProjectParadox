extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
const musics = preload("res://GameElements/Assets/sounds/Music/Present_VGM.mp3")

func _play_music(music: AudioStream, volume =0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	
	
func play_music_level():
	_play_music(musics)

func stop_music():
	stop()

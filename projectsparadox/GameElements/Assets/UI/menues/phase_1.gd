extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
var A = Global.Musics[1]

func _play_music(music: AudioStream, volume =0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	
	
func play_music_level():
	_play_music(A)

func stop_music():
	stop()

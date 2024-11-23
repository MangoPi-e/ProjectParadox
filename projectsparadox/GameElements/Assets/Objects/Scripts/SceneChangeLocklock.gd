extends Lock
@export
var Scene:String

func lock_open_sequence(Is_Open):
	if Is_Open:
		Global.change_the_scene(Scene)
	super(Is_Open)

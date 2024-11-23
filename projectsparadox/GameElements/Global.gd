extends Node

#Tracking progress
var TimeP:int = 0
var TimeMod: int = 1
var TimeMod2: int = 1
var TimeTrack: float = 0
var MaxTime: int = 20
var TimeTravel:int = 0
var TimesPositions:Array[Vector2]
func _process(delta: float) -> void:
	if TimeTravel > 0:
		TimeTrack += delta * TimeMod
		if TimeTrack >= 0.5:
			PlayerObject.Glitch.visible = false
		if TimeTrack >= MaxTime - 0.5:
			PlayerObject.Glitch.visible = true
		if TimeTrack >= MaxTime:
			TimeTrack = 0
			TimeP = randi_range(0, TimeTravel)
			PlayerObject.position = TimesPositions[TimeP]
		
	
	
	

#Objects to access
var PlayerObject:Player

var Inventory:Array[String] = []

#index for menue
var index: int =0

#global for toggle button
var toggle: bool =false

var toggle2: bool =false

var visible:bool =false

var CheckIfExit:bool =false

#Scene Managment
func change_the_scene(Scene):
	get_tree().change_scene_to_file(Scene)
#enable-diable functions
func enable_player():
	PlayerObject.Enabled = true
func disable_player():
	PlayerObject.Enabled = false

func enable_table(Table):
	Table.Enabled = true
func disable_table(Table):
	Table.Enabled = false

extends Node

#Tracking progress
var TimeP:int = 0
var Phase:int = 0
var TimeMod: int = 1

#Objects to access
var PlayerObject:Player

var Inventory:Array[String] = []

#index for menue
var index: int =0

#global for toggle button
var toggle: bool =false

var toggle2: bool =false

var visible:bool =false

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

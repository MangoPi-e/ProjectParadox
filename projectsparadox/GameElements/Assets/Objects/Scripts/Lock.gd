extends Button
class_name Lock

@export var Keys:Array[String]
@export var EffectedObjects:Node
@export var Enabled:bool = true

func check_for_keys():
	var Flag = true # a Flag that tracks if all the keys are in the inventory
	for key in Keys:
		Flag = Flag and key in Global.Inventory
	return Flag

func lock_open_sequence(IsOpen):
	if IsOpen and EffectedObjects:
		for EObject in EffectedObjects.get_children():
			if EObject.has_method("lock_open_sequence"):
				EObject.lock_open_sequence()

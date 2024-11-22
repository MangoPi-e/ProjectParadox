extends Node2D
@export var Keys:Array[String]
@export var EffectedObjects:Node
@export var Interactable:bool = true

var PlayerInRange:bool = false

func check_for_keys():
	var Flag = true # a Flag that tracks if all the keys are in the inventory
	for key in Keys:
		Flag = Flag and key in Global.Inventory
	return Flag

func lock_open_sequence():
	for EObject in EffectedObjects.get_children():
		if EObject.has_method("lock_open_sequence"):
			EObject.lock_open_sequence()

#OpenFromArea Signals
func _on_open_from_area_body_entered(body: Node2D) -> void:
	PlayerInRange = Interactable

func _on_open_from_area_body_exited(body: Node2D) -> void:
	PlayerInRange = false

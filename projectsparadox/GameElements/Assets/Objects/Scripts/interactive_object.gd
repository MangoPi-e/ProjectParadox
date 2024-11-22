extends Node2D


var PlayerInRange:bool

@export var Keys:Array[String]
@export var EffectedObjects:Node
@export var Enabled:bool = true

func check_for_keys():
	var Flag = true # a Flag that tracks if all the keys are in the inventory
	for key in Keys:
		Flag = Flag and key in Global.Inventory
	return Flag



func activate_sequance(GoodToGo):
	if PlayerInRange and GoodToGo and EffectedObjects:
		for EObject in EffectedObjects.get_children():
			if EObject.has_method("activate_sequance"):
				EObject.activate_sequance()
		
		
		

func _on_interaction_area_body_entered(body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interaction_area_body_exited(body: Node2D) -> void:
	PlayerInRange = false

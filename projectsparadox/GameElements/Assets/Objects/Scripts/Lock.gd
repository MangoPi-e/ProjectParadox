extends Node2D
class_name Lock

@export_category("Data")
@export var ID:String = "Lock0"
@export var Keys:Array[String]
@export var ChangePercent: float = 1.2
@export_category("Modes")
@export var Enabled:bool = true
@export_category("Objects")
@export var EffectedObjects:Node

@onready var Anim = $AnimSprite
var ObjectInRange:Key
var ChangePercentVector: Vector2


func _ready() -> void:
	Anim.play(ID)
	ChangePercentVector = scale * ChangePercent

func _process(delta: float) -> void:
	if ObjectInRange:
		scale.x = move_toward(scale.x, ChangePercentVector.x, delta*2)
		scale.y = move_toward(scale.y, ChangePercentVector.y, delta*2)
		if ObjectInRange.ID in Keys and ObjectInRange.FollowMouse == false:
			Keys.erase(ObjectInRange.ID)
			ObjectInRange.queue_free()
			ObjectInRange = null
			lock_open_sequence(len(Keys) <= 0)
		
	else:
		scale.x = move_toward(scale.x, ChangePercentVector.x/ChangePercent, delta*2)
		scale.y = move_toward(scale.y, ChangePercentVector.y/ChangePercent, delta*2)

func lock_open_sequence(IsOpen):
	if IsOpen and EffectedObjects:
		for EObject in EffectedObjects.get_children():
			if EObject.has_method("lock_open_sequence"):
				EObject.lock_open_sequence()




func _on_adding_area_area_entered(area: Area2D) -> void:
	ObjectInRange = area.get_parent()
	
		

func _on_adding_area_area_exited(_area: Area2D) -> void:
	ObjectInRange = null

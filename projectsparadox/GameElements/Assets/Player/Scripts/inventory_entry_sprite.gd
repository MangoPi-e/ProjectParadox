extends Node2D

@export_category("Data")
@export var ChangePercent: float = 1.2
@export_category("Modes")
@export var Enabled:bool = false
@export_category("Objects")
var ObjectInRange:Key
var ChangePercentVector: Vector2
@onready var Anim = $InventoryEntrySprite

func _ready() -> void:
	if Enabled:
		Anim.play("Show")
	else:
		Anim.play("Hide")
	ChangePercentVector = scale * ChangePercent

func _process(delta: float) -> void:
	if Enabled:
		if ObjectInRange:
			scale.x = move_toward(scale.x, ChangePercentVector.x, delta*2)
			scale.y = move_toward(scale.y, ChangePercentVector.y, delta*2)
			if ObjectInRange.FollowMouse == false:
				Global.Inventory.append(ObjectInRange.ID)
				ObjectInRange.queue_free()
				ObjectInRange = null
		
		else:
			scale.x = move_toward(scale.x, ChangePercentVector.x/ChangePercent, delta*2)
			scale.y = move_toward(scale.y, ChangePercentVector.y/ChangePercent, delta*2)

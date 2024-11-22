extends Node2D


@export var ID:String
@export var Enabled:bool = true
@export var Collectable:bool = true
@export var NeedsSpace:bool = true

var PlayerInRange:bool = false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Collect():
	if not(NeedsSpace):
		Global.MasslessInventory.append(ID)
	elif len(Global.Inventory) < 2:
		Global.Inventory.append(ID)

func _on_collect_area_body_entered(body: Node2D) -> void:
	PlayerInRange = Collectable and Enabled


func _on_collect_area_body_exited(body: Node2D) -> void:
	PlayerInRange = false

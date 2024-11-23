extends Node2D
@onready var InvEntry = $InventoryEntry
@export var Enabled:bool = false
@export var CenterPos: Vector2
var CameraMan:Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CenterPos = Vector2(0, position.y - 7.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Enabled:
		pass
	else:
		InvEntry.Enabled = false

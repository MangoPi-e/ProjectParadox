extends Node2D
@onready var InvEntry = $InventoryEntry
@export var Enabled:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Enabled:
		pass
	else:
		InvEntry.Enabled = false

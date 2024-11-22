extends Button
class_name Key

@export var ID:String
@export var Enabled:bool = true
@export var NeedsSpace:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Enabled and button_down:#button_down : this is a signal transmitted by the button when held down
		Collect()

func Collect():
	if not(NeedsSpace):
		Global.MasslessInventory.append(ID)
	elif len(Global.Inventory) < 2:
		Global.Inventory.append(ID)

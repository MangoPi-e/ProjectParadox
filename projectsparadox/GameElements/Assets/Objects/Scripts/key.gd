extends Node2D
class_name Key
@export_category("Data")
@export var ID:String = "Key0"
@export_category("Modes")
@export var Enabled:bool = true
@export var Interactable:bool = true
@export var NeedsSpace:bool = true
@export var Collectable:bool = false

@onready var Anim = $AnimSprite
var MouseInRange:bool = false
var FollowMouse:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Anim.play(ID)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Enabled and MouseInRange:
		if FollowMouse:
			position = get_global_mouse_position()
		if Collectable:
			Collect()
		elif Interactable and Input.is_action_just_pressed("Interact"):
			Hold()
	

func Collect():
	if not(NeedsSpace):
		Global.MasslessInventory.append(ID)
	elif len(Global.Inventory) < 2:
		Global.Inventory.append(ID)

func Hold():
	FollowMouse = not(FollowMouse)

func _on_inteact_area_mouse_entered() -> void:
	MouseInRange = Enabled and (Interactable or Collectable)


func _on_inteact_area_mouse_exited() -> void:
	MouseInRange = false

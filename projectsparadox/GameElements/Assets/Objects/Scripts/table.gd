extends Node2D
@onready var InvEntry = $InventoryEntry
@export var Enabled:bool = false
@export var CenterPos: Vector2
@export var EnableInventory:bool = true
@export var EnableDrg:bool = false
var OpenDrg:Vector2 = Vector2(0, 80)
@export var OtherDrg:AnimatedSprite2D
@onready var Drg = $AnimatedSprite2D2
var CameraMan:Camera2D
var MouseIn:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InvEntry.Enabled = EnableInventory
	CenterPos = Vector2(0, position.y - 7.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if MouseIn and "Key1" in Global.Inventory:
		move_drg()
	if Enabled and Input.is_action_pressed("Puse"):
		CameraMan.FollowThePlayer = true
		Global.enable_player()
		Global.disable_table(self)
	else:
		InvEntry.Enabled = false

func move_drg():
	Drg.position += OpenDrg
	OtherDrg.position += OpenDrg


func _on_area_2d_mouse_entered() -> void:
	MouseIn = EnableDrg


func _on_area_2d_mouse_exited() -> void:
	MouseIn = false

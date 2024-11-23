extends Node2D

var CameraMan:Camera2D
var PlayerInRange:bool
@onready var Text = $Label
@export_category("Data")

@export_category("Modes")
@export var Enabled:bool = true

@export_category("Objects")
@export var Table: Node2D
@export var PlayerObj:Player

func _ready() -> void:
	CameraMan = PlayerObj.CameraMan

func _process(_delta: float) -> void:
	if Enabled:
		activate_sequance(Input.is_action_just_pressed("Interact"))

func activate_sequance(GoodToGo):
	if PlayerInRange and GoodToGo:
		Text.visible = false
		Global.disable_player()
		Global.enable_table(Table)
		CameraMan.position = Table.CenterPos
		CameraMan.FollowThePlayer = false
		Table.CameraMan = CameraMan

func _on_interaction_area_body_entered(_body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interaction_area_body_exited(_body: Node2D) -> void:
	PlayerInRange = false

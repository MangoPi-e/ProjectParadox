extends Node2D

var PlayerInRange:bool = false
@export var Enabled:bool = true
@export var Mode = 0
@export var OtherPot:Node2D
@export var Glitch:bool = false

@onready var ShakeRect = $ColorRect
@onready var Anim = $AnimSprite
func _process(_delta: float) -> void:
	ShakeRect.visible = Glitch
	if Input.is_action_pressed("Interact") and PlayerInRange:
		match Mode:
			1: 
				OtherPot.Mode = Mode + 1
				Mode = 0
				Global.Inventory.append("Seed1")
			2:
				OtherPot.Glitch = true
				OtherPot.Anim.play("PotCarrot")
				OtherPot.Mode = Mode + 1
				Mode = 0
				Global.Inventory.erase("Seed1")
			3:
				Mode = 0
				Anim.play("PotFull")
				OtherPot.Anim.play("PotFull")
				Global.Inventory.append("Carrot1")

func _on_interact_body_entered(_body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interact_body_exited(_body: Node2D) -> void:
	PlayerInRange = false

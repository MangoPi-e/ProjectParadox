extends Node2D

@export var Mode = 0
@export var Enabled:bool = true
var PlayerInRange:bool = false 
@onready var Anim = $AnimSprite
@export var OtherGlobe:Node2D
@export var Glitch:bool = false
@onready var ShakeRect = $ColorRect

func _process(delta: float) -> void:
	ShakeRect.ShakeRect.visible = Glitch
	if PlayerInRange and Input.is_action_pressed("Interact"):
		match Mode:
			1:#you can't open it it's rusty
				pass
			2:
				OtherGlobe.Anim.play("Open")
				Anim.play("Open")
				OtherGlobe.Glitch = true
				OtherGlobe.Mode = 3
			3:
				Global.Inventory.append("Key1")


func _on_interact_body_entered(body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interact_body_exited(body: Node2D) -> void:
	PlayerInRange = false

extends Node2D

@export var Mode = 0
@export var Enabled:bool = true
var PlayerInRange:bool = false 
@onready var Anim = $AnimSprite

func _process(_delta: float) -> void:
	if PlayerInRange and Input.is_action_pressed("Interact"):
		match Mode:
			1:#you can't open it it's rusty
				if "Carrot1" in Global.Inventory:
					Global.Inventory.erase("Carrot1")
					Anim.play("Carrot")
					Global.Inventory.append("Fu")
				else:
					pass
			2:
				pass
			3:
				pass


func _on_interact_body_entered(_body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interact_body_exited(_body: Node2D) -> void:
	PlayerInRange = false

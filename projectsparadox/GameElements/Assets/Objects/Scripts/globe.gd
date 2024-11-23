extends Node2D

@export var Mode = 0
@export var Enabled:bool = true
var PlayerInRange:bool = false 
@onready = $AnimSprite

func _process(delta: float) -> void:
	if PlayerInRange and Input.is_action_pressed("Interact"):
		match Mode:
			1:#you can't open it it's rusty
				pass
			2:
				
				


func _on_interact_body_entered(body: Node2D) -> void:
	PlayerInRange = Enabled


func _on_interact_body_exited(body: Node2D) -> void:
	PlayerInRange = false

extends AnimatedSprite2D

var Mouse = false


func _process(delta: float) -> void:
	if Mouse and Input.is_action_just_pressed("Interact"):
		Global.Inventory.append("ture")
		queue_free()
func _on_area_00g_mouse_entered() -> void:
	Mouse = true 


func _on_area_00g_mouse_exited() -> void:
	Mouse = false

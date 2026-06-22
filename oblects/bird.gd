extends Area2D

const FLY_SPEED = 600.0

func _physics_process(delta: float) -> void:
	position.x += FLY_SPEED * delta
	
	if position.x > 1200: 
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if body.visible:
			print("Placeholder caught the player!")
			get_tree().reload_current_scene()

extends Node2D

const FLY_SPEED = 600.0

func _ready() -> void:
	get_tree().create_timer(4.0).timeout.connect(queue_free)
	
func _physics_process(delta: float) -> void:
	global_position.x += FLY_SPEED * delta
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if body.visible:
			print("🦅 The bird caught the worm!")
			if body.has_method("set_physics_process"):
				body.set_physics_process(false) 
			await get_tree().create_timer(0.2).timeout
			body.visible = false
			await get_tree().create_timer(1.0).timeout
			get_tree().reload_current_scene()
			

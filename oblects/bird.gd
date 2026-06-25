extends Area2D

const FLY_SPEED = 600.0

func _ready() -> void:
	get_tree().create_timer(4.0).timeout.connect(queue_free)
	
func _physics_process(delta: float) -> void:
	position.x += FLY_SPEED * delta
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if body.visible:
			print("Placeholder caught the player!")
			get_tree().reload_current_scene()

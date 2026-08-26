extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Globals.score += 1
		AudioManager.play("res://assets/sounds/wolfy_sanic-collect-ring-15982.mp3")
		queue_free()
		

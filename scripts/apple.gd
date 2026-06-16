extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	#check if the object entering is the player
	if body.name == "player":
		body.adds_score(1)
		queue_free()

extends Area2D

@onready var collision_box = $CollisionShape2D

func _on_timer_timeout() -> void:
	modulate = Color(1, 0, 0)
	

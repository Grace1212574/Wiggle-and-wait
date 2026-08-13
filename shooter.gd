extends Node2D

var bullet_prefab = preload("res://bullet.gd") 

func _on_timer_timeout() -> void:

	var new_bullet = bullet_prefab.instantiate()
	new_bullet.global_position = global_position 
	new_bullet.direction = Vector2.RIGHT
	

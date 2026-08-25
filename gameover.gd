extends Control

	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Globals.score = 0
		get_tree().change_scene_to_file("res://u_ilayer.tscn")

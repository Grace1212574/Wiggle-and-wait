extends Control

func _process(delta: float) -> void:
	# "ui_accept" is the Space bar by default!
	if Input.is_action_just_pressed("ui_accept"):
		# Change this path to the exact name of your Main Menu file
		get_tree().change_scene_to_file("res://main_menu.tscn")

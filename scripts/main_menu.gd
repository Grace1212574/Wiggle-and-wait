extends CanvasLayer


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _on_highscore_pressed() -> void:
	get_tree().change_scene_to_file("res://gameover.gd")

	

extends CanvasLayer

@onready var box_container: VBoxContainer = $BoxContainer
@onready var panel_2: Panel = $Panel2


func _ready() -> void:
	box_container.visible = true
	panel_2.visible =false
	

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _on_highscore_pressed() -> void:
	box_container.visible = false
	panel_2.visible = true
	
	get_tree().change_scene_to_file("res://gameover.gd")

	

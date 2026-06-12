
extends Node2D


var leaf_prefab = preload("res://leaf.tscn")
var apple_prefab = preload("res://apple.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_appletimer_timeout() -> void:
	var apple = apple_prefab.instantiate()
	add_child(apple)
	var random_x = randi_range(-665,804)
	var random_y = randi_range(-422,485)
	apple.global_position = Vector2(random_x,random_y)


func _on_leaftimer_timeout() -> void:
	var leaf = leaf_prefab.instantiate()
	get_tree().current_scene.add_child(leaf)
	var random_x = randi_range(-665,804)
	var random_y = randi_range(-422,485)
	leaf.global_position = Vector2(random_x,random_y)

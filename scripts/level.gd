
extends Node2D

@export var max_apples: int = 13
@export var max_leaf: int = 7


@onready var warning_label = $CanvasLayer2/warninglabel
@onready var player = $player
@onready var bird_timer = $birdtimer
@onready var lable_timer = $labelTimer

var bird_prefab = preload("res://bird.tscn")
var leaf_prefab = preload("res://leaf.tscn")
var apple_prefab = preload("res://apple.tscn")

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_appletimer_timeout() -> void:
	var current_apple = get_tree().get_nodes_in_group("apples").size()
	if current_apple < max_apples:
		var apple = apple_prefab.instantiate()
		add_child(apple)
		var random_x = randi_range(-665,804)
		var random_y = randi_range(-422,485)
		apple.global_position = Vector2(random_x,random_y)

func _on_leaftimer_timeout() -> void:
	var current_leaf = get_tree().get_nodes_in_group("leaf").size()
	if current_leaf < max_leaf:
		var leaf = leaf_prefab.instantiate()
		get_tree().current_scene.add_child(leaf)
		var random_x = randi_range(-665,804)
		var random_y = randi_range(-422,485)
		leaf.global_position = Vector2(random_x,random_y)
		
func start_random_bird_timer() -> void:
	bird_timer.wait_time = randf_range(10.0, 20.0)
	bird_timer.start()
	warning_label.show()
	lable_timer.start()
	
	


func _on_birdtimer_timeout() -> void:
	if player.visible: 
		start_random_bird_timer()
		var bird = bird_prefab.instantiate()
		add_child(bird)
		bird.global_position = Vector2(player.global_position.x - 700, player.global_position.y)
		start_random_bird_timer()


func _on_label_timer_timeout() -> void:
	warning_label.hide()

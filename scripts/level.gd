
extends Node2D

@export var max_apples: int = 13
@export var bird_prefab: PackedScene = preload("res://bird.tscn")

@onready var warning_label = $CanvasLayer2/warninglabel
@onready var player = $player
@onready var bird_timer = $birdtimer
@onready var label_timer = $labelTimer

var leaf_prefab = preload("res://leaf.tscn")
var apple_prefab = preload("res://apple.tscn")

func _ready() -> void:
	

	warning_label.hide()
	
	for i in range(max_apples):
		_on_appletimer_timeout()
		
	await get_tree().create_timer(2.0).timeout
	start_random_bird_timer()

func _process(_delta: float) -> void:
	pass
	
func _on_appletimer_timeout() -> void:
	var current_apple = get_tree().get_nodes_in_group("apples").size()
	if current_apple < max_apples:
		var apple = apple_prefab.instantiate()
		apple.add_to_group("apples")
		
		var random_x = randf_range(1829.0,-2270.0 )
		var random_y = randf_range(-847.0,996.0)
		apple.global_position = Vector2(random_x, random_y)
		
		for leaf in get_tree().get_nodes_in_group("hide"):
			if apple.global_position.distance_to(leaf.global_position) < 80.0:
				return
			
		add_child(apple)

func _on_leaftimer_timeout() -> void:
	if warning_label.visible and not player.visible:
		warning_label.hide()
		label_timer.stop()
		start_random_bird_timer()
 
		
func start_random_bird_timer() -> void:
	bird_timer.wait_time = randf_range(8.0, 20.0)
	bird_timer.start()

func _on_birdtimer_timeout() -> void:
	if player == null: return
	
	if not player.visible: 
		start_random_bird_timer()
	else:
		warning_label.show()
		AudioManager.play("res://assets/sounds/dragon-studio-crow-calls-raspy-echoing-472377.mp3")
		label_timer.wait_time = 3.0 
		label_timer.start()

func _on_label_timer_timeout() -> void:
	warning_label.hide()
	
	if player.visible:
		var bird = bird_prefab.instantiate()
		add_child(bird)
		bird.global_position = Vector2(player.global_position.x - 500, player.global_position.y)
		AudioManager.play("res://assets/sounds/lordsonny-long-whoosh-194554.mp3")
		var anim = bird.get_node_or_null("AnimatedSprite2D")
		if anim:
			anim.play("default")
	else:
		start_random_bird_timer()
		
	

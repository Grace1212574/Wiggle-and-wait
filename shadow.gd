extends Area2D

@onready var shadow = $Shadow
@onready var boot = $boot
@onready var hitbox = $CollisionShape2D

func _on_timer_timeout() -> void:
	# 1. Hide the shadow and show the boot
	shadow.visible = false
	boot.visible = true
	
	# 2. Turn on the collision box to crush the player!
	hitbox.set_deferred("disabled", false)
	
	# 3. Wait 1 second so the boot stays on screen, then delete it
	await get_tree().create_timer(1.0).timeout
	queue_free()

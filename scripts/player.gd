extends CharacterBody2D


var SPEED = 300.0
var score = 0
var hidingplaces = []

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED
	move_and_slide()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("hide"):
		if not hidingplaces.has(area):
			hidingplaces.append(area)
		self.visible = false
		modulate.a = 0.5
		
	if area.is_in_group("mud"): 
		SPEED = 150.0
		
func _on_hitbox_area_exited(area: Area2D) -> void:
	if area.is_in_group("hide"):
		hidingplaces.erase(area)
		if hidingplaces.is_empty():
			self.visible = true
			modulate.a = 1.0
			
	if area.is_in_group("mud"): # 👈 4. NEW: When you leave mud...
		SPEED = 300.0
	

extends CharacterBody2D


const SPEED = 300.0
var score = 0
@onready var apple_label = %Label

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED
	move_and_slide()
	
func adds_score(number):
	score += number
	apple_label.text = "Apples"+str(score)

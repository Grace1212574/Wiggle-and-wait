extends Label

func _ready() -> void:
	text = "Score: " + str(Globals.score)

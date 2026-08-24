extends Control

func _ready() -> void:
	if Globals.score > Globals.highscore:
		Globals.highscore = Globals.score
		
	$HighscoreLabel.text = "Highscore: " + str(Globals.highscore)
		
	Globals.score = 0

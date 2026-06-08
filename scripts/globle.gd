extends Node

var apple = 0
func add_apple():
	apple += 1
	emit_signal("apple_collected")
	signal apple_collected

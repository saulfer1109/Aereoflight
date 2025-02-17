extends Control
var points = 0
@export var Score :Label

func _ready():
	pass
	
func addPoints():
	points += 1
	print(points)
	Score.text = "Score: " + str(points)
	
	

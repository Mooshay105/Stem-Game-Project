extends Node

var score =0
@onready var game_manager = %GameManager
@onready var score_lable = $ScoreLable

func inc_score():
	score += 1
	score_lable.text = "You collected " + str(score) + " coins!"
	print(score)

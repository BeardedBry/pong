extends Node2D

const ball = preload("res://scenes/ball/Ball.tscn")

onready var ball_container = $BallContainer
onready var ball_spawn = $BallStart
onready var timer_restart = $Timer
onready var score_board = $UIContainer/Score

var left_score = 0
var right_score = 0

func _ready():
	pass


func ball_died(wall):
	timer_restart.start()
	if wall == Wall.Side.LEFT:
		right_score += 1
	elif wall == Wall.Side.RIGHT:
		left_score += 1
		
#	score_board.text = left_score + " - " + right_score
	score_board.text = "%s - %s" % [left_score, right_score]
	

func _on_Timer_timeout():
	var newBall = ball.instance()
	ball_container.add_child(newBall)
	newBall.global_position = ball_spawn.global_position
	

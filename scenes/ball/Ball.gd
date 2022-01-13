extends Area2D

var speed = 200
var direction = Vector2.LEFT

signal dead(side)

func _ready():
	connect("dead", get_node("/root/Game"), 'ball_died')

func _physics_process(delta):
	global_position += speed * direction * delta


func _on_Node2D_area_entered(area):
	if area is Paddle:
		direction.x *= -1
		direction.y = (global_position.y - area.position.y) / 16
	elif area is Wall:
		if area.wall_side == Wall.Side.TOP or area.wall_side == Wall.Side.BOTTOM:
			direction.y *= -1
		else:
			emit_signal("dead", area.wall_side)
			queue_free()

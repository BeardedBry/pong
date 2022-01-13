extends Area2D

class_name Paddle

enum Side {
	LEFT,
	RIGHT
}

var speed = 200

export(Side) var side = Side.LEFT

	
func _physics_process(delta):
	if Input.is_action_pressed("left_up") and side == Side.LEFT:
		global_position.y -= speed * delta
	if Input.is_action_pressed("left_down") and side == Side.LEFT:
		global_position.y += speed * delta
		
	if Input.is_action_pressed("right_up") and side == Side.RIGHT:
		global_position.y -= speed * delta
	if Input.is_action_pressed("right_down") and side == Side.RIGHT:
		global_position.y += speed * delta
	
	global_position.y = clamp(global_position.y, 0, 400)
	

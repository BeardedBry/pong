extends Area2D

class_name Wall

enum Side {
	TOP,
	BOTTOM,
	LEFT,
	RIGHT
}

export(Side) var wall_side = Side.TOP

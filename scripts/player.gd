extends Node2D

var size = 15

func _draw():
	draw_circle(Vector2(0, 0), size, Color(1, 1, 1))

func _ready():
	pass
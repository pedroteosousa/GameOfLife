extends Node2D

var radius = 15
var speed = 220

func _draw():
	draw_circle(Vector2(0, 0), radius, Color(0, 0, 0))

func _process(delta):
	var pos = get_pos()
	
	var direction = get_parent().get_node("Player").get_pos() - pos
	direction = direction.normalized()
	
	pos += direction*speed*delta
	if (get_parent().started):
		set_pos(pos)

func _ready():
	set_process(true)
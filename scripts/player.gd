extends Node2D

var radius = 15
var speed = 300

func _draw():
	draw_circle(Vector2(0, 0), radius, Color(1, 1, 1))

func _process(delta):
	var pos = get_pos()
	
	var direction = Vector2(0, 0)
	if (Input.is_action_pressed("move_up")):
		direction.y -= 1
	if (Input.is_action_pressed("move_down")):
		direction.y += 1
	if (Input.is_action_pressed("move_right")):
		direction.x += 1
	if (Input.is_action_pressed("move_left")):
		direction.x -= 1
	direction = direction.normalized()
	
	get_node("Particles2D").set_emitting(direction.length() != 0)
	
	pos += direction*speed*delta
	if (!get_parent().ended):
		set_pos(pos)

func _ready():
	set_process(true)
extends Node

var started = false
var ended = false

func _process(delta):
	var player = get_node("Player")
	var death = get_node("Death")
	
	if ((player.get_pos()-death.get_pos()).length() <= player.radius + death.radius):
		ended = true
	
	var screen_size = get_viewport().get_rect().size
	if (ended and death.get_scale().x*death.radius < max(screen_size.x, screen_size.y)):
		death.set_scale(death.get_scale()*1.05)
	
	get_node("Timer").connect("timeout", self, "startGame")

func startGame():
	started = true
	get_node("Timer").stop()

func _ready():
	get_node("Death").set_pos(get_node("Death").get_pos() - Vector2(0, -200))
	started = false
	get_node("Timer").set_wait_time(5)
	get_node("Timer").start()
	set_process(true)
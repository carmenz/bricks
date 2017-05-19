extends KinematicBody2D

const ball_scene = preload("res://Mini Scenes/Ball.xml")

func _ready():
	# tell the node to run the fixed process function
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	var y = get_pos().y
	var mouse_x = get_viewport().get_mouse_pos().x
	set_pos(Vector2(mouse_x, y))
	
func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		# we need to instance a scene and add it to the scene tree
		var ball = ball_scene.instance()
		ball.set_pos(get_pos() - Vector2(0, 16))
		# add to scene tree
		get_tree().get_root().add_child(ball)
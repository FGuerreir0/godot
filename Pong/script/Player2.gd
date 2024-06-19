extends StaticBody2D

var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Player_2_Movement_Up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("Player_2_Movement_Down"):
		position.y += get_parent().PADDLE_SPEED * delta
	
	#limit paddle movement
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)

class_name main
extends Sprite2D

@onready var end_scene = preload("res://scenes/end.tscn") as PackedScene
@onready var opponent = $CPU
@onready var player2_opponent = $Player2

const PADDLE_SPEED : int = 500

func _ready():
	if Singleton.versus == "PLAYER2":
		opponent.queue_free()
	else:
		player2_opponent.queue_free()

func _on_ball_timer_timeout():
	$Ball.new_ball()

func check_score_end():
	$"Hud/CPU Score".text = str(Singleton.score[1])
	$"Hud/Player Score".text = str(Singleton.score[0])
	
	if(Singleton.score[1] == 5 or Singleton.score[0] == 5):
		get_tree().change_scene_to_packed(end_scene)
	else:
		$BallTimer.start()
	
func _on_score_left_body_entered(body):
	Singleton.score[1] += 1
	check_score_end()

func _on_score_right_body_entered(body):
	Singleton.score[0] += 1
	check_score_end()


	

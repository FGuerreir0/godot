class_name End
extends Control

@onready var next_button = $MarginContainer/HBoxContainer/VBoxContainer/NextButton as Button
@onready var menu_scene = preload("res://scenes/menu.tscn") as PackedScene
@onready var winner_label = $MarginContainer/VBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	next_button.button_down.connect(on_next_pressed)

func _process(delta:float) -> void:
	update_winner_text()
	
func update_winner_text():
	if(Singleton.score[0] > Singleton.score[1]):
		winner_label.text = "Player wins!"
	else:
		winner_label.text = "CPU wins!"
		
func on_next_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
	Singleton.score = [0,0]

	


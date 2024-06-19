class_name MainMenu
extends Control

@onready var start_button_cpu = $MarginContainer/HBoxContainer/VBoxContainer/StartGame as Button
@onready var start_button_player2 = $MarginContainer/HBoxContainer/VBoxContainer/StartGamePlayer as Button
@onready var exit_menu = $MarginContainer/HBoxContainer/VBoxContainer/ExitGame as Button
@onready var start_level = preload("res://scenes/main.tscn") as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button_cpu.button_down.connect(on_start_pressed)
	start_button_player2.button_down.connect(on_start_player_pressed)
	exit_menu.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	Singleton.versus = 'CPU'
	get_tree().change_scene_to_packed(start_level)

func on_start_player_pressed() -> void:
	Singleton.versus = 'PLAYER2'
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void:
	get_tree().quit()
	


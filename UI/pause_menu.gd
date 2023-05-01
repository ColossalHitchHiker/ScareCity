extends Node2D

func _ready():
	$PauseUI.visible=false

func _input(event:InputEvent):
	if Input.get_action_strength("pause"):
		$PauseUI.visible=true
		get_tree().paused=true

func _on_resume_pressed():
	get_tree().paused=false
	$PauseUI.visible=false
	
func _on_quit_mm_pressed():
	get_tree().paused=false
	get_tree().change_scene_to_file("res://_Scenes/Main_Menu.tscn")

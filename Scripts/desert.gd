extends Node2D

var copened

func _ready():
	copened=0

func gotoHub():
	Utils.saveGame()
	get_tree().change_scene_to_file("res://_Scenes/hub.tscn")	

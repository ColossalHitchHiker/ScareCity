extends Node2D

@onready var is_player_hub:bool=false
@onready var desert=get_node("/root/Desert")
@onready var tween


func _ready():
	$Warning.visible=false

func _input(event:InputEvent):
	if (Input.is_action_just_pressed("interact") and is_player_hub and desert.copened>0):
		desert.gotoHub()
	elif(Input.is_action_just_pressed("interact") and is_player_hub and desert.copened==0):
		$Warning.visible=true
		tween=get_tree().create_tween()
		tween.tween_property($Warning,"position",$Warning.position-Vector2(0,15),1)
		tween.tween_property($Warning,"modulate:a",0,0.2)
		await get_tree().create_timer(1.2).timeout
		$Warning.position = Vector2(6, -47)
		$Warning.modulate.a = 1.0
		$Warning.visible = false


func _on_door_2d_body_entered(body):
	if body.is_in_group("player"):
		is_player_hub=true


func _on_door_2d_body_exited(body):
	if body.is_in_group("player"):
		is_player_hub=false

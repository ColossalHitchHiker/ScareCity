extends AnimatedSprite2D

@export var object_scene:PackedScene=null

@onready var is_player_inside:bool=false
@onready var is_opened:bool=false

@onready var animationplayer: AnimationPlayer = get_node("AnimationPlayer")
@onready var tween
@onready var desert=get_node("/root/Desert")


func _ready():
	assert(object_scene!=null)
	animationplayer.play("Idle")
	$Label.visible=false

func _input(_event:InputEvent):
	if (Input.get_action_strength("interact") and is_player_inside and not is_opened):
		is_opened=true
		desert.copened+=1
		animationplayer.play("Open")
		
func drop_object()->void:
	var value=generate_Ice()
	$Label.text="+"+str(value)
	Game.Ice+=value
	$Label.visible=true
	tween=get_tree().create_tween()
	tween.tween_property($Label,"position",$Label.position-Vector2(0,15),1)
	tween.tween_property($Label,"modulate:a",0,0.2)

func generate_Ice():
	var rand_num = randf()
	if rand_num < 3.0/5:
		return 20
	elif rand_num < 3.0/5 + 1.0/3:
		return 30
	elif rand_num < 3.0/5 + 1.0/3 + 1.0/3:
		return 40
	else:
		return 50

func _on_chest_body_entered(body):
	if body.is_in_group("player"):
		is_player_inside=true


func _on_chest_body_exited(body):
	if body.is_in_group("player"):
		is_player_inside=false

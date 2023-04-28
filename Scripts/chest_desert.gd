extends AnimatedSprite2D

@export var object_scene:PackedScene=null
@onready var drop="res://Items/test.tscn"

@onready var is_player_inside:bool=false
@onready var is_opened:bool=false

@onready var animationplayer: AnimationPlayer = get_node("AnimationPlayer")
@onready var tween


func _ready():
	tween=get_tree().create_tween()
	assert(object_scene!=null)
	animationplayer.play("Idle")

func _input(event:InputEvent):
	if (Input.get_action_strength("interact") and is_player_inside and not is_opened):
		is_opened=true
		animationplayer.play("Open")
	
		
func drop_object()->void:
	var object = load(drop)
	var objectD = object.instantiate()
	add_child(objectD)

	#tween.bezier_interpolate(objectD, "position", position, position + Vector2(0, -5), 0.3).set_trans(Tween.TRANS_QUAD, Tween.EASE_OUT)
	#tween.start()
	#await (tween)

	#tween.bezier_interpolate(objectD, "position", position + Vector2(0, -5), position, .3).set_trans(Tween.TRANS_SINE, Tween.EASE_OUT)
	#tween.start()



func _on_area_2d_body_entered(body):
	is_player_inside=true



func _on_area_2d_body_exited(body):
	is_player_inside=false



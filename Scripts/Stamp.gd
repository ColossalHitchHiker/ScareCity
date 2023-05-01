extends Node2D

@onready var animationplayer: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	$Timer.set_one_shot(true)
	$Timer.start()
	
func _process(_delta):
	if($Timer.time_left==0):startIT()
	#print($Timer.time_left)

func startIT():
	animationplayer.play("Trap")


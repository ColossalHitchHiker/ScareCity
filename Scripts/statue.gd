extends Node2D

@onready var animationplayer: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	animationplayer.play("statue")

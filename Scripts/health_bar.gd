extends TextureProgressBar

func _process(delta):
	#print(get_node("/root/Desert/PlayerFox").health," ",value)
	value=Game.playerHP

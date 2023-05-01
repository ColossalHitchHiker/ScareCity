extends Node2D

var costSpeed
var costJump

var lvlSpeed
var lvlJump

func _ready():
	lvlSpeed=(Game.playerSpeed-100)/20
	lvlJump=Game.jumpH/20
	costSpeed=100*lvlSpeed
	costJump=100*lvlJump
	$UpgradeUI/Control/Panel/speed.text=str(costSpeed)
	$UpgradeUI/Control/Panel/jump.text=str(costJump)
	$UpgradeUI.visible=false


func startIT():
	$UpgradeUI.visible=true

		
		
func _on_speed_up_pressed():
	if Game.Ice>=costSpeed:
		Game.Ice-=costSpeed
		Game.playerSpeed+=20


func _on_jump_up_pressed():
	if Game.Ice>costJump:
		Game.Ice-=costJump
		Game.jumpH+=20

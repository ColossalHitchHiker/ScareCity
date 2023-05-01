extends CharacterBody2D

@onready var moveSpeed: float = Game.playerSpeed

@onready var jump_height:float=Game.jumpH
@onready var jump_time_to_peak:float=Game.jumpP
@onready var jump_time_to_descent:float=Game.jumpD

@onready var jump_velocity:float = ((2.0  * jump_height)	/jump_time_to_peak)*-1.0
@onready var jump_gravity:float=((-2.0 * jump_height)/(jump_time_to_peak*jump_time_to_peak))*-1.0
@onready var fall_gravity:float=(-2.0*jump_height)/(jump_time_to_descent*jump_time_to_descent) *-1.0


@onready var death_bar=get_node("/root/Desert/UI/death_bar")
@onready var water_bar=get_node("/root/Desert/UI/Water/water_bar")
@onready var statue_Arrow=get_node("/root/Desert/Traps/Statue/Arrow")
@onready var is_player_up:bool=false

var state_machine 

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	
	state_machine=$AnimationTree.get('parameters/playback')
	# Getting direction
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		0
	)

	if inputDirection==Vector2(1,0):
		#Right
		$Sprite2D.flip_h=false
		state_machine.travel('run')
	elif inputDirection==Vector2(-1,0):
		#Left
		$Sprite2D.flip_h=true
		state_machine.travel('run')
	elif inputDirection==Vector2(0,0):
		state_machine.travel('Idle')
		
	# Update velocity
	velocity.x = inputDirection.x * moveSpeed
	velocity.y+=get_gravity()*_delta
	
	#Jump
	if Input.get_action_strength("up") and is_on_floor():
		jump()
	else:
		print(int(velocity.y))
	# Move the character
	move_and_slide()
	
func get_gravity() -> float:
	return jump_gravity if velocity.y<0.0 else fall_gravity

func jump():
	velocity.y=jump_velocity


func _on_area_2d_body_entered(body):
	if body==self:
		Game.playerHP-=100



func _on_safe_zone_body_exited(body):
	if(water_bar.flag!=0):	
		water_bar.flag=2
	death_bar.resumeTween()


func _on_safe_zone_body_entered(body):
	water_bar.flag=1
	death_bar.pauseTween()


func _on_axe_swing_body_entered(body):
	if body==self:
		Game.playerHP-=10


func _on_arrow_2d_body_entered(body):
	if body==self:
		#print(self.health)
		statue_Arrow.visible=false
		Game.playerHP-=10


func _on_retract_2d_body_entered(body):
		if body==self:
			Game.playerHP-=20


#HUB 
func _on_upgrade_body_entered(body):
	if body==self:
		is_player_up=true
	
func _on_upgrade_body_exited(body):
	if body==self:
			is_player_up=false
			
func _input(_event:InputEvent):
	if (Input.get_action_strength("interact") and is_player_up):
		$"../UpgradeUI".startIT()



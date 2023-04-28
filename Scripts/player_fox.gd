extends CharacterBody2D

@export var moveSpeed: float = 100

@export var jump_height:float
@export var jump_time_to_peak:float
@export var jump_time_to_descent:float

@onready var jump_velocity:float = ((2.0  * jump_height)	/jump_time_to_peak)*-1.0
@onready var jump_gravity:float=((-2.0 * jump_height)/(jump_time_to_peak*jump_time_to_peak))*-1.0
@onready var fall_gravity:float=(-2.0*jump_height)/(jump_time_to_descent*jump_time_to_descent) *-1.0

@onready var health=100

@onready var death_bar=get_node("/root/Desert/UI/death_bar")

func _physics_process(_delta):
	# Getting direction
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		0
	)

	# Update velocity
	velocity.x = inputDirection.x * moveSpeed
	velocity.y+=get_gravity()*_delta
	
	#Jump
	if Input.get_action_strength("up") and is_on_floor():
		jump()
	# Move the character
	move_and_slide()
	
func get_gravity() -> float:
	return jump_gravity if velocity.y<0.0 else fall_gravity

func jump():
	velocity.y=jump_velocity


func _on_area_2d_body_entered(body):
	if body==self:
		self.health-=100
	pass # Replace with function body.



func _on_safe_zone_body_exited(body):
	death_bar.resumeTween()


func _on_safe_zone_body_entered(body):
	death_bar.pauseTween()

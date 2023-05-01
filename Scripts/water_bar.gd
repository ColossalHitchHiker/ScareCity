extends TextureProgressBar

@onready var death_bar=get_node("/root/Desert/UI/death_bar")
@onready var flag=1

func _ready():
	self.value=100

func _process(_delta):
	if self.value<=11:
		joever()

func _input(_event:InputEvent):
	if(Input.get_action_strength("action") and flag==2):
		#decrease water
		self.value-=20
		#Increase death_bar
		var value=random_number()
		death_bar.addJuice(value)
		
		
		
func random_number():
	var numbers = [10, 20, 30]
	#1 in 4 chance of hitting jackpot
	var lucky=randi()%4
	if lucky==0:
		return 40
	else:
		var index = randi() % numbers.size()
		return numbers[index]
	
func joever():
	flag=0

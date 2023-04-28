extends TextureProgressBar

@export
var timer = 3
@onready var tween
@onready var flag=1
@onready var player = get_node("/root/Desert/PlayerFox")


func _ready():
	self.value = 100
	
	tween = get_tree().create_tween()
	tween.tween_property(self, "value", 0, timer).set_trans(Tween.TRANS_LINEAR)
	pauseTween()

func pauseTween():
	tween.pause()
	flag=2

func resumeTween():
	flag=1
	tween.play()

func _process(delta):
	if self.value == 0 and flag==1:
		$Timer.start()
		flag=0
	
func addJuice(value):
	#print("ADDED",self.value)
	self.value+=value
	tween.stop()
	tween = get_tree().create_tween()
	tween.tween_property(self, "value", 0, timer).set_trans(Tween.TRANS_LINEAR)
	flag=1
	
func _on_timer_timeout():
	if flag==0:
		player.health -= 10

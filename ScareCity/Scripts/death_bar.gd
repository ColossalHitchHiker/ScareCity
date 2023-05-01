extends TextureProgressBar

@export
var timer = 3
@onready var flag=1
@onready var player = get_node("/root/Desert/PlayerFox")

func _ready():
	self.value = 100
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "value", 0, timer).set_trans(Tween.TRANS_LINEAR)
	

func _process(delta):
	if self.value == 0 and flag==1:
		$Timer.start()
		flag=0
	
func _on_timer_timeout():
	player.health -= 10

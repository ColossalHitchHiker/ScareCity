extends Node

const SAVE_PATH="res://savegame.bin"

func saveGame():
	var file=FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	var data:Dictionary={
		"playerHP":Game.playerHP,
		"Ice":Game.Ice,
		"jumpH":Game.jumpH,
		"jumpP":Game.jumpP,
		"jumpD":Game.jumpD,
		"playerSpeed":Game.playerSpeed
	}
	var jstr=JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file=FileAccess.open(SAVE_PATH,FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH)==true:
		if not file.eof_reached():
			var current_line=JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP =current_line["playerHP"]
				Game.Ice=current_line["Ice"]
				Game.jumpH=current_line["jumpH"]
				Game.jumpP=current_line["jumpP"]
				Game.jumpD=current_line["jumpD"]
				Game.playerSpeed=current_line["playerSpeed"]
		



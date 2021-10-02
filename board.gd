extends MonopolyResource
class_name GameBoard

var context = null

#func _init():

func get_resource_dir():
	return "presets" 
	



func load_from_saved(save_name): 
	var saved_board = load_by_file_name(save_name)
	context = GameContext.new()
	context.load_context_from_preset(saved_board)

	


func load_from_profile(profile_name): pass


	

extends Node

func load_template():
	var file = File.new()
	file.open("res://model/template.json", File.READ)
	var content = file.get_as_text()
	file.close()
	var res: JSONParseResult = JSON.parse(content)
	if res.error != OK:
		print_debug(res.error_string)
		print_debug(res.error_line) 
	if not typeof(res.result) == TYPE_ARRAY:
		push_error("Failed loading basic_shapes")
	return res.result


func _ready():
	load_template()

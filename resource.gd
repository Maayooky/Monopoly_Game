class_name MonopolyResource

func _get_resource_dir(): pass

func load(tags):
	loaded_resouces = {}
	file_name = ""
	path = "res://{}".format(_get_resource_dir())
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		file_name = dir.get_next()
		while file_name != "":
			res = load_resource("{}/{}".format(path, file_name))
			for tag in tags:
				if tag in res.tags:
					loaded_resources[res.name] = res
	return loaded_resources
	
func load_resource(path)
	var file = File.new()
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	var res: JSONParseResult = JSON.parse(content)
	if res.error != OK:
		print_debug(res.error_string)
		print_debug(res.error_line) 
	if not typeof(res.result) == TYPE_ARRAY:
		push_error("Failed loading template")
	return res.result



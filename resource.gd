extends Object
class_name MonopolyResource

func _get_resource_dir(): pass

func load_by_attirbutes(attributes):
	var loaded = {}
	var file_name = ""
	var path = "res://{}".format(_get_resource_dir())
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		file_name = dir.get_next()
		while file_name != "":
			var res = load_resource("{}/{}".format(path, file_name))
			for name in attributes:
				for value in attributes[name]:
					if res.get(name)!=null and value in res.get(name):
						loaded[res.name] = res
			file_name = dir.get_next()
	return loaded

func load_by_tags(tags):
	return load_by_attirbutes({"tags": tags})
	
func load_by_name(names):
	return load_by_attirbutes({"name": names})

func load_by_file_name(file_name, file_ext=".json"):
	var path = "res://{}".format(_get_resource_dir())
	return load_resource("{}/{}{}".format([path, file_name, file_ext]))

func load_resource(path):
	"""
	handle both formats JSON and GD resource (res/tres)
	"""
	if path.ends_with(".json"):
		var file = File.new()
		file.open(path, File.READ)
		var content = file.get_as_text()
		file.close()
		var res: JSONParseResult = JSON.parse(content)
		if res.error != OK:
			print_debug(res.error_string)
			print_debug(res.error_line)
			push_error("Failed loading resource") 
		return res.result
	else:
		var res: Resource = ResourceLoader.load(path)
		if res==null:
			push_error("Failed loading resource, path="+path) 
		return res 


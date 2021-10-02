extends Object
class_name MonopolyResource

func get_resource_dir(): 
	return "NotImplemented"
	
	
func load_by_attirbutes(attributes):
	var loaded = {}
	var file_name = ""
	var path = "res://%s"%get_resource_dir()
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		file_name = dir.get_next()
		while file_name != "":
			var res = load_resource("%s/%s" % [path, file_name])
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
	var path = "res://%s" % get_resource_dir()
	return load_resource("%s/%s%s" % [path, file_name, file_ext])

func load_resource(path):
	"""
	handle both formats JSON and GD resource (res/tres)
	"""
	if path.ends_with(".json"):
		var file = File.new()
		file.open(path, File.READ)
		var content: String = file.get_as_text()
		var res: JSONParseResult = JSON.parse(content)
		if res.error_line > -1:
			print_debug("ERROR parsing json: line=%s, error=%s" % [res.error_line, res.error_string])
			push_error("Failed loading resource") 
		return res.result
	else:
		var res: Resource = ResourceLoader.load(path)
		if res==null:
			push_error("Failed loading resource, path="+path) 
		return res 


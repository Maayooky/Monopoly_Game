extends Object
class_name GameProfile

func load_profile(name):
	var file = File.new()
	file.open("res://{}.json".format(name), File.READ)
	var content = file.get_as_text()
	file.close()
	var res: JSONParseResult = JSON.parse(content)
	if res.error != OK:
		print_debug(res.error_string)
		print_debug(res.error_line) 	if not typeof(res.result) == TYPE_ARRAY:
		push_error("Failed loading template")
	return res.result



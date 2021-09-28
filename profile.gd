extends MonopolyResource
class_name GameProfile

func _get_resource_dir():
	return "profiles"

func load_profile(name):
	return load_by_file_name(name)


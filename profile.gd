extends MonopolyResource
class_name GameProfile

func get_resource_dir():
	return "profiles"

func load_profile(name):
	return self.load_by_file_name(name)


# GdUnit generated TestSuite
#warning-ignore-all:unused_argument
#warning-ignore-all:return_value_discarded
class_name profileTest
extends GdUnitTestSuite

# TestSuite generated from
const __source = 'res://profile.gd'
const GameProfile = preload(__source)

func test_load_from_saved() -> void:
	var profile = GameProfile.new()
	var loaded = profile.load_by_file_name("basic")
	assert(loaded!=null, "expecting loaded profile")

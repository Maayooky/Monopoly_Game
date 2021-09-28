extends MonopolyResource
class_name SeriesHolding

var _holdings = {}
var size = -1 
var name = ""

func _get_resource_dir():
	return "holdins"
	
func is_series():
	return size>0 and _holdings.keys().count() == size 

func get_holdings():
	return _holdings.values()

func add(holding: Holding):
	_holdings[holding.name] = holding

func remove(holding: Holding):
	_holdings.erase(holding.name)





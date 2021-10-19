extends MonopolyResource
class_name SeriesHolding

var _holdings = {}
var size = -1 
var name = ""

func _get_resource_dir():
	return "holdings"
	
func is_series():
	return size>0 and _holdings.keys().count() == size 

func get_holdings():
	return _holdings.values()

func add(holding: Holding):
	_holdings[holding.name] = holding

func remove(holding: Holding):
	_holdings.erase(holding.name)

func get_visit_price(holding: Holding, factor=1):
	var prime = holding.prime_assets
	var basic = holding.basic_assets
	var purchase = holding.purchase
	return purchase * (prime+1) * (basic+1) * factor

func get_mortgage(holding: Holding):
	return get_visit_price(holding) / 2



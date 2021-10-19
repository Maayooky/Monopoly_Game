extends Object
class_name GameContext

var players = {}
var holdings = {}
var lottery_cards = []
var profile

func get_player(name):
	if players.get(name)==null:
		players[name] = Player.new()
	return players[name]

func load_holdings(tags):
	holdings = Holding.new().load_from_dir(tags)

func get_series_holding(series_name):
	if not holdings.has(series_name):
		var series_holding = SeriesHolding.new()
		series_holding.name = series_name
		holdings[series_name] = series_holding
	return holdings.get(series_name)

func add_holding(series_holding, name, position, basic_price):
	var holding = Holding.new()
	holding.name = name
	holding.position = position
	holding.purchase = basic_price
	series_holding.add(holding)

func load_context_from_preset(saved):
	for tile in saved.board:
		var owner_name = tile.owner
		var series_name = tile.series_name
		var holding_name = tile.holding_name
		var holding_position = tile.position
		var holding_basic_price = tile.basic_price
		var series_holding = self.get_series_holding(series_name)
		self.add_holding(series_holding, holding_name, holding_position, holding_basic_price)
		
		var player = get_player(owner_name)
		player.name = owner_name
		player.holding_positions.append(tile.position)


func save_context_as_preset(name): pass

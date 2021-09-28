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

func load_context_from_preset(saved):
	for tile in saved.board:
		var player_name = tile.player
		var series_name = tile.series_name
		var holding_name = tile.holding_name
		var series_holding = SeriesHolding.new()
		series_holding.name = series_name
		var _res = series_holding.load_by_file_name(series_name)
		var holding = Holding.new()
		holding.name = holding_name
		holding.position = tile.position
		series_holding.add(holding)
		holdings[series_name] = series_holding
		var player = get_player(player_name)
		player.name = player_name
		player.holding_positions.append(tile.position)


func save_context_as_preset(name): pass

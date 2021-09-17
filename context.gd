extends Object
class_name GameContext

var playrs = []
var holdings = {}
var lottery_cards = []
var profile

func load_holdings(tags):
	holdings = Holding.new().load_from_dir(tags)

func saveContext(): pass

func loadContext(): pass

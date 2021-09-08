extends Object
class_name Player

var name = ""
var cash = 0
var holdings = []
var position = 0
var cards = []
var skin = NAN

func add_holdings(holding: SeriesHolding):
	holdings.append(holding)

func keep_card(card: Card):
	cards.append(card)
	


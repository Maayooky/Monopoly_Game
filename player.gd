extends Object
class_name Player

var name = ""
var cash = 0
var holding_positions = []
var position = 0
var cards = []
var skin = NAN

func add_holding(pos: int):
	holding_positions.append(pos)

func keep_card(card: Card):
	cards.append(card)
	


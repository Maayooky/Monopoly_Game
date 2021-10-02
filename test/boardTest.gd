# GdUnit generated TestSuite
#warning-ignore-all:unused_argument
#warning-ignore-all:return_value_discarded
class_name boardTest
extends GdUnitTestSuite

# TestSuite generated from
const __source = 'res://board.gd'
const GameBoard = preload(__source)

func assert_context(ctx) -> void:
	assert(null != ctx[0], "expecting non null value")
	assert(ctx is GameContext, "expecting GameContext context")
	assert(ctx.playrs!=null, "expecting players populated")
	assert(ctx.holdings!=null, "expecting holdings populated")
	assert(ctx.lottery_cards!=null, "expecting lottery_cards populated")
	assert(ctx.profile!=null, "expecting profile populated")
	

func test_load_from_saved() -> void:
	var board = GameBoard.new()
	board.load_by_file_name("g1")	
	assert_context(board.context)

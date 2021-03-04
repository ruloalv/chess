class Board
	attr_reader :grid, :whites, :blacks, :turn

	def initialize(grid = Array.new(8) {Array.new(8)}, params = {})
		@grid = grid
		@whites = params[:whites]
		@blacks = params[:blacks]
		@trun = params[:turn]
	end
end
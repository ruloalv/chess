class Piece
	attr_reader :name, :color, :position

	def initialize(name, color, position)
		@name = name
		@color = color
		@position = position
	end
end

class King < Piece
	@@MOVES = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]

	def posible_moves
		@@MOVES.map {|m| [@position[0] + m[0], @position[1] + m[1]}
			   .keep_if {|m| valid_position(m)}
	end
end
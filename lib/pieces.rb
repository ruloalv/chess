class Piece
	attr_reader :name, :color, :position, :symbol

	def initialize(name, color, position, symbol)
		@name = name
		@color = color
		@position = position
		@symbol = symbol
	end

	def move(pos)
		if self.posible_moves.include?(pos) && self.valid_position(pos)
			@position = pos
		end
	end

	def valid_position(pos)
		self.posible_moves.include?(pos)
	end
end

class King < Piece
	@@MOVES = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]

	def initialize(color, position)
		color == 'Black' ? symbol = " \u265A " : symbol = " \u2654 "
		super("King", color, position, symbol)
	end

	def posible_moves
		@@MOVES.map {|m| [@position[0] + m[0], @position[1] + m[1]}
			   .keep_if {|m| valid_position(m)}
	end
end

class Rook < Piece
	@@MOVES = [[0,1],[0,-1],[1,0],[-1,0]]

	def initialize(color, position)
		color == 'Black' ? symbol = " \u265C " : symbol = " \u2656 "
		super('Rook', color, position, symbol)
	end
end

class Bishop < Piece
	@@MOVES = [[-1,-1],[-1,1],[1,1],[1,-1]]

	def initialize(color, position)
		color == 'Black' ? symbol = " \u265D " : symbol = " \u2657 "
		super('Bishop', color, position, symbol)
	end
end

class Knight < Piece
	@@MOVES = [[-1,2],[1,2],[1,-2],[-1,-2],[-2,1],[2,1],[2,-1],[-2,-1]]

	def initialize(color, position)
		color == 'Black' ? symbol = " \u265E " : symbol = " \u2658 "
		super('Knight', color, position, symbol)
	end
end

class Pawn < Piece
	def initialize(color, position)
		color == 'Black' ? symbol = " \u265F " : symbol = " \u2659 "
		super('Pawn', color, position, symbol)
	end
end
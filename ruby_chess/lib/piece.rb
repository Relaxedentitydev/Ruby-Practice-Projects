class Piece
	attr_reader :color, :position

	def initialize(color, position)
		@color = color
		@position = position
	end

	def move_to(new_position)
		@position = new_position
	end

	def valid_moves(board)
		# implemented in sub-classes
	end

	def on_board?(position)
		position.all? {|coord| coord.between?(0,7)}
	end

	def generate_moves(board, directions)
		row,col = @new_position
		moves = []

		directions.each do |dx, dy|
			new_pos = [row + dx, col + dy]

			while on_board?(new_pos)
				target = board[new_pos[0]][new_pos[1]]
				if target.nil?
					moves << new_pos
				elsif target.color != @color
					moves << new_pos
					break
				else 
					break
				end
				new_pos = [new_pos[0] + dx, new_pos[1] + dy]
			end
		end

		moves
	end

end

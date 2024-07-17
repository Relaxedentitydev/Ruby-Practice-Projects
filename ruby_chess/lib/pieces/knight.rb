class Knight < Piece

	def valid_moves(board)
		row,col = @position
		moves = []
		knight_moves = [
			[2,1], [2,-1], [-2,1], [-2,-1],	
			[1,2], [1,-2], [-1,2], [-1,-2]
		]

		knight_moves.each do |dx, dy|
			new_pos = [row + dx, col + dy]
			if on_board?(new_pos)
				target = board[new_pos[0],new_pos[1]]
				moves << new_pos if target.nil? || target.color != @color
			end 
		end

		moves
	end

end
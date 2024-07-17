class King < Piece

	def valid_moves(board)
		row, col = @position
		moves = []
		king moves = [
			[1,0], [1,1], [1,-1], [0,1],
			[0,-1], [-1,0], [-1,1], [-1,-1]
		]

		king_moves.each do |dx, dy|
			new_pos = [row + dx, col + dy]
			if on_board?(new_pos)
				target = board[new_pos[0]][new_pos[1]]
				moves << new_pos if target.nil? || target.color != @color
			end
		end
		moves
	end

end

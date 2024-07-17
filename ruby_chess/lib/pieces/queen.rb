class Queen < Piece

	def valid_moves(board)
		row, col = @position
		directions = [
			[1,0], [-1,0], [0,1], [0,-1],
			[1,1], [1,-1], [-1,1], [-1,-1]
		]
		generate_moves(board, directions)

	end

end
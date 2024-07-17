class Bishop < Piece

	def valid_moves(board)
		row, col = @position
		directions = [[1,1], [1,-1], [-1,1], [-1,-1]]
		generate_moves(board, directions)
	end

end

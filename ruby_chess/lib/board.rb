require_relative 'piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'



class Board
	attr_accessor :grid

	def initialize 
		@grid = Array.new(8) {Array.new(8)}
		setup_pieces
	end

	def setup_pieces
		(0..7).each do |col|
			@grid[1][col] = Pawn.new(:black, [1, col])
			@grid[6][col] = Pawn.new(:white, [6, col])
		end

		#rooks
		@grid[0][0] = Rook.new(:black, [0, 0])
    	@grid[0][7] = Rook.new(:black, [0, 7])
    	@grid[7][0] = Rook.new(:white, [7, 0])
    	@grid[7][7] = Rook.new(:white, [7, 7])

    	#knights
    	@grid[0][1] = Knight.new(:black, [0, 1])
    	@grid[0][6] = Knight.new(:black, [0, 6])
    	@grid[7][1] = Knight.new(:white, [7, 1])
    	@grid[7][6] = Knight.new(:white, [7, 6])

    	#bishops
    	@grid[0][2] = Bishop.new(:black, [0, 2])
    	@grid[0][5] = Bishop.new(:black, [0, 5])
    	@grid[7][2] = Bishop.new(:white, [7, 2])
    	@grid[7][5] = Bishop.new(:white, [7, 5])

    	#queens
    	@grid[0][3] = Queen.new(:black, [0, 3])
    	@grid[7][3] = Queen.new(:white, [7, 3])

    	#kings
    	@grid[0][4] = King.new(:black, [0, 4])
    	@grid[7][4] = King.new(:white, [7, 4])

	end

	def move_piece(start_pos, end_pos)
    	piece = @grid[start_pos[0]][start_pos[1]]
    	if piece && piece.valid_moves(@grid).include?(end_pos)
      		@grid[end_pos[0]][end_pos[1]] = piece
      		@grid[start_pos[0]][start_pos[1]] = nil
      		piece.move_to(end_pos)
    	else
      		raise "Invalid move"
    	end
  	end

  	def display
    	@grid.each do |row|
     	puts row.map { |piece| piece ? piece.class.name[0] : "." }.join(" ")
    	end
  	end

end
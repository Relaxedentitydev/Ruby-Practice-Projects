class Pawn < Piece
  def valid_moves(board)
    row, col = @position
    moves = []

    direction = @color == :white ? -1 : 1

    # Move forward
    one_step = [row + direction, col]
    moves << one_step if on_board?(one_step) && board[one_step[0]][one_step[1]].nil?

    # Capture diagonally
    [[row + direction, col - 1], [row + direction, col + 1]].each do |move|
      next unless on_board?(move)
      target = board[move[0]][move[1]]
      moves << move if !target.nil? && target.color != @color
    end

    # Initial double step move
    if (row == 6 && @color == :white) || (row == 1 && @color == :black)
      two_step = [row + 2 * direction, col]
      moves << two_step if on_board?(two_step) && board[two_step[0]][two_step[1]].nil? && board[one_step[0]][one_step[1]].nil?
    end

    moves
  end
end
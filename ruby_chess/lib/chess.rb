class Chess
  def initialize
    @board = Board.new
    @current_player = :white
  end

  def play
    loop do
      @board.display
      puts "#{@current_player}'s turn. Enter move (e.g., 'e2 e4'):"
      input = gets.chomp
      start_pos, end_pos = parse_input(input)

      begin
        @board.move_piece(start_pos, end_pos)
        switch_player
      rescue => e
        puts "Error: #{e.message}"
      end
    end
  end

  private

  def parse_input(input)
    start_str, end_str = input.split
    [parse_position(start_str), parse_position(end_str)]
  end

  def parse_position(pos_str)
    col, row = pos_str.split('')
    [8 - row.to_i, col.ord - 'a'.ord]
  end

  def switch_player
    @current_player = @current_player == :white ? :black : :white
  end
end

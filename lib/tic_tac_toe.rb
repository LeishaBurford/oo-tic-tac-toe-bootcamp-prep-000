class TicTacToe
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board(board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(board, index, token)
    @board[index] = token
  end
  
  def position_taken?(board, index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(board, index)
    if position_taken?(board, index) || !index.between?(0, 8)
      return false
    end
    return true
  end
  
  def turn(board)
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    while !valid_move?(board, index)
      puts "Please enter 1-9:"
      index = input_to_index(gets.strip)
    end
    move(board, index, current_player(board))
    display_board(board)
  end
  
  def turn_count(board)
    counter = 0
    board.each do |place| 
      if place == "X" || place == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player(board)
    return (turn_count(board) % 2 == 0) ? "X" : "O"
  end
end

  
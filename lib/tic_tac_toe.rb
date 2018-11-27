#WIN_COMBINATIONS
WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]
#display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#input to index
def input_to_index(input)
index = input.to_i - 1
end

#move
def move(board, index, current_player)
  board[index] = current_player
end
#position_taken

def position_taken?(board,index)
board[index] == "X" || board[index] == "O" #? true : false
end

#valid move
def valid_move?(board,index)
index.between?(0,8) && !position_taken?(board,index) #? true : false
end

#turn

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input_to_index(input)
  if valid_move?(board,index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# won
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end


#full
def full?(board)
board.none?{|value| value == " " }
end


#draw
def draw?(board)
  full?(board) && !won?(board)
end


#over
def over?(board)
won?(board) || full?(board) #? true : false
end

#winner
def winner(board)
  if winning_combo = won?(board)
  #  puts board[winning_combo.first]
    board[winning_combo.first]
  else
    nil
  end
end

#turn count
def turn_count(board)
count = 0
  board.each do|value|
    "#{value}" != " "  ? count += 1 : false
  end
    return count
end

#play
def play(board)
counter = 0
 until counter == 9
  turn(board)
  counter += 1
  end
end

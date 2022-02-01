# frozen_string_literal: true

test_board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
current_player = true
winner = false
def player_turn(board, player, x_coord, y_coord)
  player = player ? 'x' : 'o'
  board[y_coord][x_coord] == '-' ? board[y_coord][x_coord] = player : board = false
  board
end

def display_board(board)
  puts 'i 0 1 2 '
  board.each_with_index { |row, index| puts "#{index} #{row[0]} #{row[1]} #{row[2]}" }
end

def check_win(player, board)
  player = player ? 'x' : 'o'
  return player if board.any? { |row| row == [player, player, player] }
  return player if board[0][0] == player && board[1][1] == player && board[2][2] == player
  return player if board[0][2] == player && board[1][1] == player && board[2][0] == player

  (0..2).each { |num| return player if board[0][num] == player && board[1][num] == player && board[2][num] == player }
  return 'TIE' unless board.flatten.any? { |cell| cell == '-' }
end

puts 'Welcome To Tic Tac Toe!'
puts 'syntax: <x,y>'

until winner
  puts "player #{current_player ? 'x' : 'o'}'s turn"
  display_board(test_board)
  player_input = gets.chomp.split(',')
  turn = player_turn(test_board, current_player, player_input[0].to_i, player_input[1].to_i)
  unless turn
    current_player = !current_player
    puts 'Error: Not-empty cell.'
  end
  winner = check_win(current_player, test_board)
  current_player = !current_player
end
display_board(test_board)

if winner != 'TIE'
  puts "#{winner} WON!"
else
  puts 'Game Tied!'
end

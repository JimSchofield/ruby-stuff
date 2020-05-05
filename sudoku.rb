def load_board(path)
  board = []

  file = File.open(path)
  lines = file.readlines.map(&:chomp)

  lines.each do |line|
    board.push(line.split(//).map(&:to_i))
  end
  file.close

  board
end

def row_has_num?(board, row, num)
  board[row].include?(num)
end

def col_has_num?(board, col, num)
  board.any? { |row| row[col] == num }
end

def square_has_num?(board, x_coord, y_coord, num)
  base_x = (x_coord / 3).to_i * 3
  base_y = (y_coord / 3).to_i * 3

  x_range = (base_x..base_x + 2).to_a
  y_range = (base_y..base_y + 2).to_a

  # y_range.each { |row|  x_range.each { |col| p "#{row} - #{col}" }}
  y_range.any? { |row| x_range.any? { |column| board[row][column] == num } }
end

board = load_board('sudoku.board')

def get_possible_numbers(board, row, col)
  (1..9).to_a.select do |num|
    unless row_has_num?(board, row, num) || col_has_num?(board, col, num) || square_has_num?(board, row, col, num)
      p "#{num} possible!"
      num
    end
  end
end

get_possible_numbers(board,2,0)

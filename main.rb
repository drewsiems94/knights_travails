# frozen_string_literal: true

require_relative 'knight'
require_relative 'board'

game = Board.new
game.knight_moves([1, 1], [7, 5])
puts ''
game.knight_moves([0, 0], [3, 3])
puts ''
game.knight_moves([3, 3], [4, 3])

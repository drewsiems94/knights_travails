# frozen_string_literal: true

# This class stores the position of the knight and keeps track of the previous position
class Knight
  attr_accessor :position, :parent

  MOVES = [[-1, -2], [-1, 2], [-2, -1], [-2, 1],
           [1, -2], [1, 2], [2, -1], [2, 1]].freeze

  def initialize(position = nil)
    @position = position
    @parent = nil
  end
end

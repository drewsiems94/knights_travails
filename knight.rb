
class Knight
  MOVES = [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]

  attr_accessor :position, :parent

  def initialize(position = nil)
    @position = position
    @parent = nil
  end
end

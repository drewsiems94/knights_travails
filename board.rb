# frozen_string_literal: true

require_relative 'knight'

# The main class for determining the knight's shortest path
class Board
  # We use a queue here to search breadth first
  # JUST SET A  PARENT FOR EACH CHILD!!!!
  def knight_moves(start_pos, end_pos)
    board = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
    steps = [Knight.new(end_pos)]
    until steps.compact.empty?
      Knight::MOVES.each do |move|
        sum = add_array(move, steps[0].position)
        if valid_move?(sum, board)
          temp_move = Knight.new(sum)
          temp_move.parent = steps[0]
          steps << temp_move
          board.delete(sum)
          if temp_move.position == start_pos
            print_moves(temp_move)
            return end_pos
          end
        end
      end
      steps.shift
    end
  end

  private

  def valid_move?(position, board)
    return true if valid_array?(position) && board.one? { |arr| arr == position }

    false
  end

  def print_moves(move)
    count = -1
    until move.nil?
      count += 1
      print "#{move.position}\n"
      move = move.parent
    end
    print "You made it in #{count} moves."
  end

  def add_array(arr1, arr2)
    [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end

  def valid_array?(arr)
    return true if arr[0].between?(0, 7) && arr[1].between?(0, 7)

    false
  end
end

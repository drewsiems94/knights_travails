require_relative 'knight'

class Board
  attr_reader :board

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  end

  # We use a queue here to search breadth first
  # Evaluate all direct children first (1 move)
  # if no match, store the child's childdren for later and avelauate them all

  # JUST SET A  PARENT FOR EACH CHILD!!!!
  def knight_moves(start_pos, end_pos)
    root = Knight.new(start_pos)
    steps = [root]
    count = 0
    until steps.compact.empty?
      Knight::MOVES.each do |move|
        temp = add_array(move, steps[0].position)
        if valid_array?(temp) && board.one? { |arr| arr == temp }
          temp_move = Knight.new(temp)
          temp_move.parent = steps[0]
          steps << temp_move
          board.delete(temp)
          if temp_move.position == end_pos
            until temp_move.parent.nil?
              count += 1
              print "#{temp_move.position}\n"
              temp_move = temp_move.parent
            end
            print "#{temp_move.position}\nYou made it in #{count} moves."
            return end_pos
          end
        end
      end
      steps.shift
    end
  end

  private

  def add_array(arr1, arr2)
    sum_arr = [arr1[0] + arr2[0], arr1[1] + arr2[1]]
  end
  
  def valid_array?(arr)
    return true if arr[0].between?(0, 7) && arr[1].between?(0, 7)

    false
  end
end

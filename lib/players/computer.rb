module Players
  class Computer < Player
    WIN_COMBOS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    def move(board)
      WIN_COMBOS.detect do |win|
        spot_1 = (win[0] + 1).to_s
        spot_2 = (win[1] + 1).to_s
        spot_3 = (win[2] + 1).to_s
        if board.cells[win[0]] == board.cells[win[1]] && board.cells[win[0]] != (" " || "")
          return spot_3 unless board.taken?(spot_3)
        elsif board.cells[win[1]] == board.cells[win[2]] && board.cells[win[1]] != (" " || "")
          return spot_1 unless board.taken?(spot_1)
        elsif board.cells[win[2]] == board.cells[win[0]] && board.cells[win[0]] != (" " || "")
          return spot_2 unless board.taken?(spot_2)
        end
      end
      if center_and_corners(board) != nil
        value = center_and_corners(board)
      else
        return final_spots(board)
      end
      value
    end
    def center_and_corners(board)
      if board.cells[4] == "" || board.cells[4] == " "
        return 5.to_s
      elsif board.cells[0] == "" || board.cells[0] == " "
        return 1.to_s
      elsif board.cells[2] == "" || board.cells[2] == " "
        return 3.to_s
      elsif board.cells[8] == "" || board.cells[8] == " "
        return 9.to_s
      elsif board.cells[6] == "" || board.cells[6] == " "
        return 7.to_s
      end
    end
    def final_spots(board)
      if board.cells[1] == "" || board.cells[1] == " "
        value = 2.to_s
      elsif board.cells[3] == "" || board.cells[3] == " "
        value = 4.to_s
      elsif board.cells[5] == "" || board.cells[5] == " "
        value = 6.to_s
      elsif board.cells[7] == "" || board.cells[7] == " "
        value = 8.to_s
      end
      value
    end
  end
end

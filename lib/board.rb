class Board
    attr_reader :grid

    def initialize(grid=[[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]])
        @grid = grid
    end

    def place_mark(coord, symb)
        x, y = coord
        @grid[x][y]= symb
    end

    def empty?(coord)
        x, y = coord
        @grid[x][y] == nil
    end

    def winner
        # check rows and columns
        (0..2).each do |el|
            return grid[0][el] if grid[0][el] && grid[0][el] == grid[1][el] && grid[0][el] == grid[2][el]
            return grid[el][0] if grid[el][0] && grid[el][0] == grid[el][1] && grid[el][0] == grid[el][2]
        end
        return grid[0][0] if grid[0][0] && grid[0][0] == grid[1][1] && grid[0][0] == grid[2][2]
        return grid[1][1] if grid[1][1] && grid[1][1] == grid[0][2] && grid[1][1] == grid[2][0]
    end

    def over?
        return true if winner || grid.all?{|arr| arr.compact.length == 3}
        false
    end
end

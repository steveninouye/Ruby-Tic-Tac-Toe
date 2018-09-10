class ComputerPlayer
    def initialize (name)
        @name = name
        @board = [[],[],[]]
        @mark = []
    end

    def board
        @board
    end

    def display(board)
        @board = board
    end

    def mark=(symb)
        @mark = symb
    end

    def get_move
        lose_coord = []
        neutr_coord = []

        (0..2).to_a.each do |x|
            (0..2).to_a.each do |y|
                if @board.empty?([x,y])
                    type = check_directions([x,y])
                    case type
                        when "win"
                            # if there is a winning move, make the move
                            return [x,y] 
                        when "lose"
                            lose_coord.push([x,y])
                        when "neutral"
                            neutr_coord.push([x,y])
                        end
                end
            end
        end

        # block if there is a losing spot
        return lose_coord[rand(0..lose_coord.length-1)] if lose_coord.length > 0

        # all else chose a random spot
        neutr_coord[rand(0..neutr_coord.length-1)]
    end


    # receives empty spot
    # first check to see if spot is a winning spot
    # as soon as it defines the spot as a winning spot, return "win"
    # if it isn't a winning spot in all directions then check if losing spot
    # if not winning or losing spot, it is a neutral spot
    def check_directions(spot) 
        x, y = spot
        losing_spot = false

        # check rows
        type = spot_type(@board.grid[x])
        return type if type == "win"
        losing_spot = true


        # check columns
        col_els = [0,1,2].map{|el| @board.grid[el][y]}
        type = spot_type(col_els)
        return type if type == "win"
        losing_spot = true

        # check diagnals
        diag1 = [[0,0], [1,1], [2,2]]
        diag2 = [[0,2], [1,1], [2,0]]
        if diag1.any? {|el| el == spot}
            elements = diag1.map{|coord| @board.grid[coord[0]][coord[1]]}
            type = spot_type(elements)
            return type if type == "win"
            losing_spot = true

            if diag2.any? {|el| el == spot}
                elements = diag2.map{|coord| @board.grid[coord[0]][coord[1]]}
                type = spot_type(elements)
                return type if type == "win"
                losing_spot = true
            end

        elsif diag2.any? {|el| el == spot}
            elements = diag2.map{|coord| @board.grid[coord[0]][coord[1]]}
            type = spot_type(elements)
            return type if type == "win"
            losing_spot = true
        end

        # if it isn't a winning type check if it is a losing type
        return "lose" if losing_spot

        # if not losing or winning type, it is neutral
        "neutral"
    end

    def spot_type(arr)
        opp_symbol = @mark == :O ? :X : :O
        return "win" if arr.count(@mark) == 2
        return "lose" if arr.count(opp_symbol) == 2
        nil
    end
end

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
        @board.grid # this I can do array methods on
        result = []
        (0..2).to_a.each do |x|
            (0..2).to_a.each do |y|
            result.push([x,y]) if @board.empty?([x,y])
            end
        end

        result[rand(0..result.length-1)]
    end
end

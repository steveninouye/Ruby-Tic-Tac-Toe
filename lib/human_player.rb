class HumanPlayer
    attr_reader :name

    def initialize (name)
        @name = name
    end

    def get_move
        puts "where"
        input = gets.chomp
        coord = input.split(", ")
        filtered_coord = coord.select{|el| "012".include?(el)}.map{|str| str.to_i}
        if filtered_coord.length != 2
            puts "Not a valid coordinate"
            get_move!
        else
            filtered_coord
        end
    end

    def display(board)
        p board
    end
end

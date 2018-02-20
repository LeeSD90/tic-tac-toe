class Board
	attr_reader :squares

	def initialize
		@squares = Array.new(3){Array.new(3,"-")}
		draw_board
	end

	def move(input)
		return true
	end

	private

	def draw_board
		squares.each_with_index do |val, i|
			val.each_with_index do |valj, j|
				if j === 2 then print " #{valj} \n"
				else print " #{valj} |"
				end
			end
		end
	end

end
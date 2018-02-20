class Board
	attr_reader :squares

	def initialize
		@squares = [[1,2,3],[4,5,6],[7,8,9]]
		draw_board
	end

	def move(side, input)
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
class Board
	attr_reader :squares
	@@win = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[7,5,3],[1,4,7],[2,5,8],[3,6,9]]

	def initialize
		@squares = [[1,2,3],[4,5,6],[7,8,9]]
		draw_board
	end

	def move(side, input)
		i = squares.index{|x| x.include? input}
		if !i.nil? then
			squares[i][squares[i].index(input)] = side
			draw_board
			if check_win(side) then return 0 end
			return 1
		else return -1
		end
	end

	private

	def check_win(side)
		@@win.each do |i|
			count = 0
			i.each do |j|
				if squares.flatten[j-1] === side then count += 1 end
			end
			if count === 3 then return true end
		end
		return false
	end

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
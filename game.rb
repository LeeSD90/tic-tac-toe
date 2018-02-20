class Game
require './player.rb'
require './board.rb'

	def initialize
		puts "Enter a name for player 1"
		@p1 = Player.new(gets.chomp, "X")
		puts "Enter a name for player 2"
		@p2 = Player.new(gets.chomp, "O")

		@players = { 1 => @p1, 2 => @p2}
		
		puts "\nSimply enter a number 1-9 to make your move"

		@board = Board.new
		play_round
	end

	private

	def play_round
		i = 1
		playing = true
		while playing
			print "\n#{@players[i].name}, it's your turn!\n"
			while input = gets.chomp
				case input.to_i
				when 1..9
					if @board.move(@players[i].side, input.to_i) then
						break;
					else 
						i = i == 2 ? 1 : 2
						puts "\nPlease  select an unoccupied space on the board."
						/--playing=false--/
						break
					end
				else
					puts "\nPlease enter a number between 1 and 9."
				end
			end
			i = i == 2 ? 1 : 2
		end
	end

end
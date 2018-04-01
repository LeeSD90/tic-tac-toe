class Game
require './player.rb'
require './board.rb'

	def initialize
		puts "Enter a name for player 1"
		@p1 = Player.new(gets.chomp, "X")
		puts "Enter a name for player 2"
		@p2 = Player.new(gets.chomp, "O")


		@players = { 1 => @p1, 2 => @p2}
		
		puts "\nSimply enter a number 1-9 to make your move\n"
		play
	end

	private

	def play
		@board = Board.new
		i = 1
		playing = true
		while playing
			print "\n#{@players[i].name}, it's your turn!\n"
			while input = gets.chomp
				case input.to_i
				when 1..9
					case @board.move(@players[i].side, input.to_i)
					when 1 
						break;
					when 0 
						puts "\n#{@players[i].name} won the round!"
						@players[i].score += 1
						playing = false
						break;
					else 
						i = i == 2 ? 1 : 2
						puts "\nPlease  select an unoccupied space on the board."
						break;
					end
				else
					puts "\nPlease enter a number between 1 and 9."
				end
			end
			i = i == 2 ? 1 : 2
		end
		puts "Do you want to play again? Y/N"
		case gets.chomp
		when "y" || "Y"
			play
		else
			puts "Final scores -\n#{@players[1].name}: #{@players[1].score}\n#{@players[2].name}: #{@players[2].score}"
		end
	end

end
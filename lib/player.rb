class Player
	attr_reader :name
	attr_reader :side
	attr_accessor :score

	def initialize(player, side)
		@name = player
		@side = side
		@score = 0
	end
end
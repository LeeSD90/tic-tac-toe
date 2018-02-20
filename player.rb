class Player
	attr_reader :name
	attr_reader :side

	def initialize(player, side)
		@name = player
		@side = side
	end
end
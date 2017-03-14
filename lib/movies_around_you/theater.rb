class MoviesAroundYou::Theater
	
	attr_reader :name
	@@all = []

	def initialize(name)
		@name = name
		@movies = []
		@@all << self
	end

end
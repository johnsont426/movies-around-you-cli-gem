class InvalidType < StandardError ;end

class MoviesAroundYou::Theater
	
	attr_reader :name
	@@all = []

	def initialize(name)
		@name = name
		@movies = []
		@@all << self
	end

	def movies
		@movies.dup.freeze
	end

	def add_movie(movie)
		if !movie.is_a?(MoviesAroundYou::Movie)
			raise InvalidType, "Must be a Movie"
		end
		@movies << movie
	end

	def add_movie_from_collection(movie_array)
		movie_array.each do |movie|
			self.add_movie(movie)
		end
	end

	def self.all
		@@all
	end

end
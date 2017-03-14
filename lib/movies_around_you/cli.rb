class MoviesAroundYou::CLI

	attr_reader :zip_code, :url

	def get_zip
		puts "Please enter your zip code to start"
		@zip_code=gets.strip
	end

	def zip_to_url
		@url = "http://www.fandango.com/#{zip_code}_movietimes?q=#{zip_code}"
	end

	def make_theater
	end

	def add_movie_to_theater
	end

end
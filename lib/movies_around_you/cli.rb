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
		theater_array = MoviesAroundYou::Scraper.new.theater_scraper(url)
		theater_array.each do |theater_name|
			MoviesAroundYou::Theater.new(theater_name)
		end
	end

	def add_movie_to_theater
		movie_array = MoviesAroundYou::Scraper.new.movies_scraper(url)
		movie_array.each do |array|
			new_array = array.collect{|hash| MoviesAroundYou::Movie.new(hash)}
			MoviesAroundYou::Theater.all[movie_array.index(array)].add_movie_from_collection(new_array)
		end
	end

	def theaters_around
		puts "============================================================="
		puts "Here are the theaters around you:"
		theaters_array = MoviesAroundYou::Theater.all
		theaters_array.each_with_index do |theater, index|
			puts "#{index+1}. #{theater.name}"
		end
		puts "============================================================="
	end

end
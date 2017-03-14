class MoviesAroundYou::CLI

	attr_reader :zip_code, :url, :movie

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

	def movies
		puts "Which one are you going?"
		theater_number = gets.to_i
		puts "============================================================="
		puts "These are the movies playing today"

		MoviesAroundYou::Theater.all[theater_number-1].movies.each_with_index do |movie, index|
			if movie.genre
				puts "#{index+1}. #{movie.title}  (#{movie.genre})"
			else
				puts "#{index+1}. #{movie.title}"
			end
		end
		puts "============================================================="

		puts "Pick a movie"
		movie_number = gets.to_i
		@movie = MoviesAroundYou::Theater.all[theater_number-1].movies[movie_number-1]
		puts "============================================================="
		puts "<<<<<#{movie.title}>>>>>"
		if movie.time_available != []
			puts "Showtimes available:" 
			movie.time_available.each{|time| puts "#{time}"}
		else
			puts "Tickets are all out for today"
		end
		puts "============================================================="
		
	end

end
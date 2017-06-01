class MoviesAroundYou::Scraper

	def theater_scraper(url)
		html=open(url)
		doc=Nokogiri::HTML(html)
		doc.search('a.showtimes-theater-title').collect do |title|
			title.text.strip
		end
	end

	def movies_scraper(url)
		html=open(url)
		doc=Nokogiri::HTML(html)
		doc.css('.showtimes-theater').collect do |theater|
			theater.css(".showtimes-movie-container").collect do |movie|
				movie_hash = {}
				movie_hash[:title]=movie.css('.showtimes-movie-detail').css('h3').css('a')[0].text if movie.css('.showtimes-movie-detail').css('h3').css('a')[0]
				movie_hash[:genre]=movie.css('.showtimes-movie-genre').text.strip if movie.css('.showtimes-movie-genre').text.strip!=""
				movie_hash[:time_unavailable]=movie.css('.btn-inactive').collect{|time| time.text} if movie.css('.btn-inactive')
				movie_hash[:time_available]=movie.css('.btn-ticket').collect{|time| time.text} if movie.css('.btn-ticket')
				movie_hash
			end
			
		end
		
	end

end
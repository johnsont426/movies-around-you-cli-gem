class MoviesAroundYou::Scraper

	def theater_scraper(url)
		html=open(url)
		doc=Nokogiri::HTML(html)
		doc.search('a.showtimes-theater-title').collect do |title|
			title.text.strip
		end
	end

end
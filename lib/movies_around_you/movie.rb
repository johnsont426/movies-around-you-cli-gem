class MoviesAroundYou::Movie

	attr_accessor :title, :genre, :time_unavailable, :time_available

	def initialize(attributes)
		attributes.each {|key, value| self.send(("#{key}="), value)}
	end

end
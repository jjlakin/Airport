class Sky
	
	DEFAULT_WEATHER = 0.8

	def initialize
		clear_skies
	end

	def stormy?
		@stormy
	end

	def weather_generator climate = DEFAULT_WEATHER
		@stormy = rand > climate
	end

	def clear_skies
		@stormy = false
	end

end

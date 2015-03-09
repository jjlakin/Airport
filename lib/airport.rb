require_relative 'weather'

	class Airport
	
	include Weather
	DEFAULT_CAPACITY = 6


		def initialize
			@planes ||= []
			@airspace ||= []
			@landing_information = { "landing_confirmation" => 0 , "flight_log" => 0}
		end

		def landing_information(input = nil)
			input == nil ? @landing_information : @landing_information[input]
		end

		def airspace
			@airspace
		end

		def planes
			@planes
		end

		def planes_count
			@planes.count
		end

		def hanger_capacity
			@capacity = 6
		end


		def full
			planes_count == 6
		end

		def empty
			planes_count == 0
		end

		def accept (plane)
			
			if full 
				raise 'the plane storage is full'
			elsif self.stormy?
				raise 'it\'s a tad windy'
			end
			
			plane.land!
			planes << plane
			# planes.each { |plane| plane.land! }

		end

		def launch (plane = Plane)
			
			if self.stormy? 
				raise 'there is a storm brewing, please don\'t leave'
			end

			plane = planes.pop
			plane.flying!
			

		end

		def record(title, value)

			landing_information[title] = value
			
		end

		def log_check
			log_check = planes.each( |plane| plane.flying )
			
		end

		def circle
			
		end

		def weather_status

			stormy? ?	"stormy" : "clears skies"

		end

		def  fill_airport_with_weather(plane)

			# input = gets.chomp
				
			self.weather_generator
			puts stormy?
				
			while self.planes_count < 6

				self.weather_generator
				puts weather_status
					
					
				if stormy? == false
					self.accept(plane)
					puts "confirmation"
				elsif stormy? == true
					puts 'not this time'
				end
 
			end

			plane_count = planes.count
			@landing_information["landing_confirmation"] = plane_count
			@landing_information["flight_log"] = plane_count
			

		end

		def empty_airport_with_weather

			while self.planes_count > 0
					
				self.weather_generator
				

				if stormy? == false
					self.launch
					puts "confirmation"
				elsif stormy? == true
					puts 'not this time'
				end

			end

		end

	end

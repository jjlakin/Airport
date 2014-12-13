require_relative 'weather'

	class Airport
	
	include Weather
	DEFAULT_CAPACITY = 6


		def initialize
			@planes ||= []

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

		def accept (plane)
			
			if full 
				raise 'the plane storage is full'
			elsif self.stormy?
				raise 'it\'s a tad windy'
			end

			planes << plane

		end

		def launch (plane = nil)
			
			if self.stormy? 
				raise 'there is a storm brewing, please don\'t leave'
			end


			planes.delete(plane)
		end

	end



	class Airport

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
			end

			planes << plane

			

		end

		def launch (plane = nil)
			planes.delete(plane)
		end

	end

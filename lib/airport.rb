

	class Airport

		def hanger
			@hanger ||= []
		end

		def hanger_count
			@hanger.count
		end

		def accept (plane)
			
			plane.land!
			hanger << plane

		end

		def launch (plane = nil)
			hanger.delete(plane)
		end

	end

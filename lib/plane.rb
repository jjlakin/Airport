
class Plane

	def initialize
		flying!
	end

	def flying?
		@flying	
	end

	def land!
		@flying = false
	end

	def flying!
		@flying = true
	end



end
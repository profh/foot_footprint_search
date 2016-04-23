class Meal

	attr_accessor :plates_and_weights
	
	def initialize(m_type, weighted_plates)
		unless weighted_plates.empty?
			@plates_and_weights = []
			weighted_plates.each do |plate, weight|
				@plates_and_weights << [plate, weight]
			end
		end
	end

	def adjust_plate_weights
	end

	def to_json
		# method will convert meal to json structure TBD
	end


end
class Plate

	attr_accessor :foods, :name

	def initialize(name, foods={})
		@foods ||= Hash.new
		unless foods.empty?
			foods.each do |food, quantity|
				@foods[food] = quantity
			end
		end
		@name = name
	end

	def to_json
		# method will convert plate to json structure TBD
	end

end
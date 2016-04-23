class NullFood

	def name
		"Unknown"
	end

	def food_description
		"No description"
	end

	def serving_description
		"No serving description"
	end

	def total_calories
		"--"
	end

	def total_kg
		"--"
	end

	def enviro_values
		[NullEnviroValue.new]
	end

	def nutri_values
		[NullNutriValue.new]
	end

	def active
		false
	end

end
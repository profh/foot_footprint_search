# tested in food, plate, meals

class EnviroService

	ETYPES = ["Energy", "Blue Water", "Green Water", "Grey Water", "GHG Emissions"]
	MEAL_TOTALS = []

	def self.get_ev_scores_from_plate(plate)
		calculate_ev_types(plate, 1)
	end

	def self.get_ev_scores_from_meal(meal)
		totals, avg = [], []
		meal.plates_and_weights.each do |pw|
			totals << calculate_ev_types(pw[0], pw[1])
		end
		revised = totals.transpose
		revised.each do |ev_values|
			avg << ev_values.inject(0){ |s, n| s+=n }
		end
		return avg
	end

	def self.get_ev_scores_from_food(food)
		food_hash = {food => 1}
		plate = Plate.new("food", food_hash)
		calculate_ev_types(plate, 1)
	end

	def self.calculate_ev_types(plate, weight)
		arr = []
		ETYPES.size.times do |i|
			sum = 0.0
			foods = plate.foods.keys
			quantities = plate.foods.values
			plate.foods.size.times do |j|
				food_obj = foods[j]
				qty = quantities[j]
				env_val = food_obj.find_enviro_values_for_type(ETYPES[i])*qty*weight
				sum += env_val
			end
			arr << sum
		end
		return arr
	end

end


# tested in food, plate, meals

class NutriService

	ATTRIBUTES = ["Calories", "Grams", "Total Fat", "Saturated Fat", "Trans Fat",
								"Cholesterol", "Sodium", "Total Carbs", "Dietary Fiber",
								"Sugar", "Protein", "Vitamin A", "Vitamin C", "Calcium", "Iron"]

	MEAL_TOTALS = []

	def self.get_nu_scores_from_plate(plate)
		calculate_nu_types(plate, 1)
	end

	def self.get_nu_scores_from_meal(meal)
		totals, avg = [], []
		meal.plates_and_weights.each do |pw|
			totals << calculate_nu_types(pw[0], pw[1])
		end
		revised = totals.transpose
		revised.each do |nu_values|
			avg << nu_values.inject(0){ |s, n| s+=n }
		end
		return avg
	end

	def self.get_nu_scores_from_food(food)
		food_hash = {food => 1}
		plate = Plate.new("food", food_hash)
		calculate_nu_types(plate, 1)
	end

	def self.calculate_nu_types(plate, weight)
		arr = []
		ATTRIBUTES.size.times do |i|
			sum = 0.0
			foods = plate.foods.keys
			quantities = plate.foods.values
			plate.foods.size.times do |j|
				food_obj = foods[j]
				qty = quantities[j]
				nu_val = food_obj.find_nutri_values_for_attribute(ATTRIBUTES[i])*qty*weight
				sum += nu_val
			end
			arr << sum
		end
		return arr
	end


end
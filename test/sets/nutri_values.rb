module Contexts
	module NutriValues
		
		def create_nutri_values
			@apple_calories 	= FactoryGirl.create(:nutri_value, nutri_attribute: @calories, food: @apple)
			@apple_grams 			= FactoryGirl.create(:nutri_value, nutri_attribute: @grams, food: @apple)
			@apple_total_fat	= FactoryGirl.create(:nutri_value, nutri_attribute: @total_fat, food: @apple)
			@apple_sat_fat 		= FactoryGirl.create(:nutri_value, nutri_attribute: @sat_fat, food: @apple)
			@apple_trans_fat	= FactoryGirl.create(:nutri_value, nutri_attribute: @trans_fat, food: @apple)
			@apple_sodium 		= FactoryGirl.create(:nutri_value, nutri_attribute: @sodium, food: @apple)
			@apple_cholest 		= FactoryGirl.create(:nutri_value, nutri_attribute: @cholest, food: @apple)
			@apple_carbs 			= FactoryGirl.create(:nutri_value, nutri_attribute: @carbs, food: @apple)
			@apple_fiber 			= FactoryGirl.create(:nutri_value, nutri_attribute: @fiber, food: @apple)
			@apple_sugar 			= FactoryGirl.create(:nutri_value, nutri_attribute: @sugar, food: @apple)
			@apple_protein 		= FactoryGirl.create(:nutri_value, nutri_attribute: @protein, food: @apple)
			@apple_vita 			= FactoryGirl.create(:nutri_value, nutri_attribute: @vita, food: @apple)
			@apple_vitc 			= FactoryGirl.create(:nutri_value, nutri_attribute: @vitc, food: @apple)
			@apple_calcium 		= FactoryGirl.create(:nutri_value, nutri_attribute: @calcium, food: @apple)
			@apple_iron 			= FactoryGirl.create(:nutri_value, nutri_attribute: @iron, food: @apple)
			@pizza_calories 	= FactoryGirl.create(:nutri_value, nutri_attribute: @calories, food: @pizza, value: 10.00)
			@pizza_grams 			= FactoryGirl.create(:nutri_value, nutri_attribute: @grams, food: @pizza, value: 10.00)
			@pizza_total_fat	= FactoryGirl.create(:nutri_value, nutri_attribute: @total_fat, food: @pizza, value: 10.00)
			@pizza_sat_fat 		= FactoryGirl.create(:nutri_value, nutri_attribute: @sat_fat, food: @pizza, value: 10.00)
			@pizza_trans_fat	= FactoryGirl.create(:nutri_value, nutri_attribute: @trans_fat, food: @pizza, value: 10.00)
			@pizza_sodium 		= FactoryGirl.create(:nutri_value, nutri_attribute: @sodium, food: @pizza, value: 10.00)
			@pizza_cholest 		= FactoryGirl.create(:nutri_value, nutri_attribute: @cholest, food: @pizza, value: 10.00)
			@pizza_carbs 			= FactoryGirl.create(:nutri_value, nutri_attribute: @carbs, food: @pizza, value: 10.00)
			@pizza_fiber 			= FactoryGirl.create(:nutri_value, nutri_attribute: @fiber, food: @pizza, value: 10.00)
			@pizza_sugar 			= FactoryGirl.create(:nutri_value, nutri_attribute: @sugar, food: @pizza, value: 10.00)
			@pizza_protein 		= FactoryGirl.create(:nutri_value, nutri_attribute: @protein, food: @pizza, value: 10.00)
			@pizza_vita 			= FactoryGirl.create(:nutri_value, nutri_attribute: @vita, food: @pizza, value: 10.00)
			@pizza_vitc 			= FactoryGirl.create(:nutri_value, nutri_attribute: @vitc, food: @pizza, value: 10.00)
			@pizza_calcium 		= FactoryGirl.create(:nutri_value, nutri_attribute: @calcium, food: @pizza, value: 10.00)
			@pizza_iron 			= FactoryGirl.create(:nutri_value, nutri_attribute: @iron, food: @pizza, value: 10.00)
		end

		def destroy_nutri_values
			@apple_calories.delete
			@apple_grams.delete
			@apple_total_fat.delete
			@apple_sat_fat.delete
			@apple_trans_fat.delete
			@apple_sodium.delete
			@apple_cholest.delete
			@apple_carbs.delete
			@apple_fiber.delete
			@apple_sugar.delete
			@apple_protein.delete
			@apple_vita.delete
			@apple_vitc.delete
			@apple_calcium.delete
			@apple_iron.delete
			@pizza_calories.delete
			@pizza_grams.delete
			@pizza_total_fat.delete
			@pizza_sat_fat.delete
			@pizza_trans_fat.delete
			@pizza_sodium.delete
			@pizza_cholest.delete
			@pizza_carbs.delete
			@pizza_fiber.delete
			@pizza_sugar.delete
			@pizza_protein.delete
			@pizza_vita.delete
			@pizza_vitc.delete
			@pizza_calcium.delete
			@pizza_iron.delete
		end
	
	end
end

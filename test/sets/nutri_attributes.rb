module Contexts
	module NutriAttributes

		def create_nutri_attributes
			@calories 		= FactoryGirl.create(:nutri_attribute, name: "Calories", units: "calories")
			@grams 				= FactoryGirl.create(:nutri_attribute, name: "Grams")
			@total_fat 		= FactoryGirl.create(:nutri_attribute)
			@total_fat_kg = FactoryGirl.create(:nutri_attribute)
			@sat_fat 			= FactoryGirl.create(:nutri_attribute, name: "Saturated Fat")
			@trans_fat		= FactoryGirl.create(:nutri_attribute, name: "Trans Fat")
			@sodium 			= FactoryGirl.create(:nutri_attribute, name: "Sodium", units: "mg")
			@cholest 			= FactoryGirl.create(:nutri_attribute, name: "Cholesterol", units: "mg")
			@carbs 				= FactoryGirl.create(:nutri_attribute, name: "Total Carbs")
			@fiber 				= FactoryGirl.create(:nutri_attribute, name: "Dietary Fiber")
			@sugar 				= FactoryGirl.create(:nutri_attribute, name: "Sugar")
			@protein 			= FactoryGirl.create(:nutri_attribute, name: "Protein")
			@vita 				= FactoryGirl.create(:nutri_attribute, name: "Vitamin A", units: "%")
			@vitc 				= FactoryGirl.create(:nutri_attribute, name: "Vitamin C", units: "%")
			@calcium 			= FactoryGirl.create(:nutri_attribute, name: "Calcium", units: "%")
			@iron 				= FactoryGirl.create(:nutri_attribute, name: "Iron", units: "%")
		end

		def destroy_nutri_attributes
			@calories.delete
			@grams.delete
			@total_fat.delete
			@total_fat_kg.delete
			@sat_fat.delete
			@trans_fat.delete
			@sodium.delete
			@cholest.delete
			@carbs.delete
			@fiber.delete
			@sugar.delete
			@protein.delete
			@vita.delete
			@vitc.delete
			@calcium.delete
			@iron.delete
		end

	end
end
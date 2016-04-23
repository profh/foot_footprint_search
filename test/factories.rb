FactoryGirl.define do

	factory :food do
		name "apple"
		food_description "no info"
		serving_description "1 medium apple"
		active true
	end

	factory :enviro_type do
		name "Energy"
		units "MJ"
		active true
	end

	factory :enviro_value do
		association :food
		association :enviro_type
		value 1.00
	end

	factory :nutri_attribute do
		name "Total Fat"
		units "g"
		active true
	end

	factory :nutri_value do
		association :food
		association :nutri_attribute
		value 1.00
	end

end

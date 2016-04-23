require 'test_helper'

class FoodTest < ActiveSupport::TestCase

	# test relationships
	should have_many(:enviro_values)
	should have_many(:nutri_values)
	should have_many(:enviro_types).through(:enviro_values)
	should have_many(:nutri_attributes).through(:nutri_values)

	# test simple validations
	should validate_presence_of(:name)
	should validate_presence_of(:serving_description)

	context "Within context" do
    setup do
    	create_foods
    	create_enviro_types
    	create_enviro_values
    	create_nutri_attributes
    	create_nutri_values
    end

    teardown do
    	destroy_nutri_values
    	destroy_nutri_attributes
			destroy_enviro_values
			destroy_enviro_types
			destroy_foods
		end

		should "list all foods alphabetically" do
			assert_equal ["apple", "banana", "pie", "pizza"], Food.alphabetical.all.map(&:name)
		end

		should "return the enviro_value of a food given enviro_type" do
			assert_equal 1.0, @apple.find_enviro_values_for_type("Energy")
			assert_equal 1.0, @apple.find_enviro_values_for_type("Blue Water")
			assert_equal 0.0, @apple.find_enviro_values_for_type("Red Water")
			assert_equal 2.0, @banana.find_enviro_values_for_type("Energy")
			assert_equal 3.0, @pie.find_enviro_values_for_type("Energy")
			assert_equal 4.0, @pizza.find_enviro_values_for_type("Energy")
		end

		should "return the nutri_value of a food given nutri_attribute" do
			assert_equal 1.00, @apple.find_nutri_values_for_attribute("Sodium")
			assert_equal 1.00, @apple.find_nutri_values_for_attribute("Vitamin A")
			assert_equal 10.00, @pizza.find_nutri_values_for_attribute("Sodium")
		end

		should "return the enviromental impact of a food as a list of values" do
			assert_equal [1, 1, 1, 1, 1], EnviroService.get_ev_scores_from_food(@apple)
			assert_equal [2, 2, 2, 2, 2], EnviroService.get_ev_scores_from_food(@banana)
			assert_equal [3, 3, 3, 3, 3], EnviroService.get_ev_scores_from_food(@pie)
			assert_equal [4, 4, 4, 4, 4], EnviroService.get_ev_scores_from_food(@pizza)
		end

		should "return the nutritional info of a food as a list of values" do
			assert_equal [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0], NutriService.get_nu_scores_from_food(@apple)
			assert_equal [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0], NutriService.get_nu_scores_from_food(@pizza)
		end

	end

end
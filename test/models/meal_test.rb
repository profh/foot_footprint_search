require 'test_helper'

class MealTest < ActiveSupport::TestCase

	context "Within context" do
    setup do
    	create_foods
    	create_enviro_types
    	create_enviro_values
    	create_nutri_attributes
    	create_nutri_values
    	create_plates
    	create_meals
    end

    teardown do
    	destroy_meals
    	destroy_plates
    	destroy_nutri_values
    	destroy_nutri_attributes
			destroy_enviro_values
			destroy_enviro_types
			destroy_foods
		end

		should "calculate enviromental impact of meal" do
			assert_equal [5.625, 5.625, 5.625, 5.625, 5.625], EnviroService.get_ev_scores_from_meal(@meal1)
			assert_equal [11.600000000000001, 11.600000000000001, 11.600000000000001, 11.600000000000001, 11.600000000000001], EnviroService.get_ev_scores_from_meal(@meal2)
			assert_equal [0.25, 0.25, 0.25, 0.25, 0.25], EnviroService.get_ev_scores_from_meal(@meal3)
		end

        should "calculate nutritional impact of meal" do
            assert_equal [3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375, 3.375], NutriService.get_nu_scores_from_meal(@meal1)
            assert_equal [6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6], NutriService.get_nu_scores_from_meal(@meal2)
            assert_equal [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], NutriService.get_nu_scores_from_meal(@meal3)
        end

	end

end
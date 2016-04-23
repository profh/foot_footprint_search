require 'test_helper'

class PlateTest < ActiveSupport::TestCase

	context "Within context" do
    setup do
    	create_foods
    	create_enviro_types
    	create_enviro_values
    	create_nutri_attributes
    	create_nutri_values
    	create_plates
    end

    teardown do
    	destroy_plates
    	destroy_nutri_values
    	destroy_nutri_attributes
			destroy_enviro_values
			destroy_enviro_types
			destroy_foods
		end

		should "calculate enviromental impact of foods in plate" do
			assert_equal [10, 10, 10, 10, 10], EnviroService.get_ev_scores_from_plate(@plate1)
			assert_equal [12, 12, 12, 12, 12], EnviroService.get_ev_scores_from_plate(@plate2)
			assert_equal [0.0, 0.0, 0.0, 0.0, 0.0], EnviroService.get_ev_scores_from_plate(@plate3)
			assert_equal [0.5, 0.5, 0.5, 0.5, 0.5], EnviroService.get_ev_scores_from_plate(@plate4)
			assert_equal [0.0, 0.0, 0.0, 0.0, 0.0], EnviroService.get_ev_scores_from_plate(@plate5)
		end

		should "calculate nutritional impact of foods in plate" do
			assert_equal [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0], NutriService.get_nu_scores_from_plate(@plate1)
			assert_equal [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0], NutriService.get_nu_scores_from_plate(@plate2)
			assert_equal [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], NutriService.get_nu_scores_from_plate(@plate3)
			assert_equal [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], NutriService.get_nu_scores_from_plate(@plate4)
			assert_equal [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], NutriService.get_nu_scores_from_plate(@plate5)

		end

	end

end
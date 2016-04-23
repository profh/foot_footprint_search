require 'test_helper'

class NutriServiceTest < ActiveSupport::TestCase
	context "Within context" do
    setup do
    	create_foods
    	create_nutri_attributes
    	create_nutri_values
    end

    teardown do
    	destroy_nutri_values
    	destroy_nutri_attributes
			destroy_foods
		end

		should "return an array [value] of the nutri attributes given a list of foods" do
			assert_equal [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0], NutriService.sum_nutri_totals_for_meal([@apple.id, @pizza.id])
			assert_equal [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0], NutriService.sum_nutri_totals_for_meal([@pizza.id])
		end

	end
end
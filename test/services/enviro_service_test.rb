require 'test_helper'

class EnviroServiceTest < ActiveSupport::TestCase
	context "Within context" do
    setup do
    	create_foods
    	create_enviro_types
    	create_enviro_values
    end

    teardown do
			destroy_enviro_values
			destroy_enviro_types
			destroy_foods
		end

		should "return an array [value] representing the enviro types given a list of foods" do
			assert_equal [10.00, 10.00, 10.00, 10.00, 10.00], EnviroService.sum_ev_types([@apple.id, @banana.id, @pie.id, @pizza.id])
			assert_equal [6.00, 6.00, 6.00, 6.00, 6.00], EnviroService.sum_ev_types([@apple.id, @banana.id, @pie.id])
		end
		
	end
end
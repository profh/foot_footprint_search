require 'test_helper'

class EnviroTypeTest < ActiveSupport::TestCase
	
	# test relationships
	should have_many(:enviro_values)
	should have_many(:foods).through(:enviro_values)

	# test simple validations
	should validate_presence_of(:name)
	should validate_presence_of(:units)

end

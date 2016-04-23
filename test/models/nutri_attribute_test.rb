require 'test_helper'

class NutriAttributeTest < ActiveSupport::TestCase
	
	# test relationships
	should have_many(:nutri_values)
	should have_many(:foods).through(:nutri_values)

	# test simple validations
	should validate_presence_of(:name)
	should validate_presence_of(:units)

end

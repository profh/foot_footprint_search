require 'test_helper'

class NutriValueTest < ActiveSupport::TestCase
	
	# test relationships
	should belong_to(:food)
	should belong_to(:nutri_attribute)

	# test simple validations
	should validate_presence_of(:value)
	should validate_numericality_of(:value).is_greater_than_or_equal_to(0)

end

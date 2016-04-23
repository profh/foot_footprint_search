require 'test_helper'

class EnviroValueTest < ActiveSupport::TestCase
 
	# test relationships
	should belong_to(:food)
	should belong_to(:enviro_type)

	# test simple validations
	should validate_presence_of(:value)
	should validate_numericality_of(:value).is_greater_than_or_equal_to(0)

end

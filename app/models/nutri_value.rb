class NutriValue < ActiveRecord::Base

	# include FoodFootprintHelpers::Activeable

	# Relationships
	belongs_to :food
	belongs_to :nutri_attribute

	# Scopes

	# Validations
	# validates_presence_of :value
	# validates_numericality_of :value, greater_than_or_equal_to: 0

end

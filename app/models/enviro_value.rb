class EnviroValue < ActiveRecord::Base

	# include FoodFootprintHelpers::Activeable

	# Relationships
	belongs_to :food
	belongs_to :enviro_type
	
	# Scopes

	# Validations
	# validates_presence_of :value
	# validates_numericality_of :value, greater_than_or_equal_to: 0

	# Methods
	# make_active and make_inactive methods included by Activeable module

end

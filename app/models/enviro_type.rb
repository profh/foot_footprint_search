class EnviroType < ActiveRecord::Base

	# include FoodFootprintHelpers::Activeable

	# Relationships
	has_many :enviro_values
	has_many :foods, through: :enviro_values

	# Scopes
	# active and inactive scopes included by Activeable module

	# Validations
	validates_presence_of :name, :units
	
	# Methods
	# make_active and make_inactive methods included by Activeable module


end

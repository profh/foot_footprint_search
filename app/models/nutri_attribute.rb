class NutriAttribute < ActiveRecord::Base

	# include FoodFootprintHelpers::Activeable

	# Relationships
	has_many :nutri_values
	has_many :foods, through: :nutri_values

	# Scopes

	# Validations
	validates_presence_of :name, :units

end

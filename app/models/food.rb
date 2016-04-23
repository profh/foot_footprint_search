class Food < ActiveRecord::Base
	# include FfHelpers::Activeable
	include PgSearch
	pg_search_scope :search_by_name, :against => :name, :using => [:dmetaphone, :trigram]
	
	def self.search(term)
    where('LOWER(name) LIKE ?', "%#{term.downcase}%")
  end

	# Relationships
	has_many :enviro_values
	has_many :nutri_values
	has_many :enviro_types, through: :enviro_values
	has_many :nutri_attributes, through: :nutri_values

	# Scopes
	# active and inactive scopes included by Activeable module
	scope :alphabetical, -> { order(:name) }

	# Validations
	validates_presence_of :name, :serving_description

	# Methods
	# make_active and make_inactive methods included by Activeable module

	# function returns the enviro_value for a food given an enviro_type
	# returns 0.0 if no value associated with type
	def find_enviro_values_for_type(etype)
		val = enviro_values.select{ |ev| ev.enviro_type.name == "#{etype}"}
		if val.empty?
			return 0.0
		else
			val.first.value
		end
	end

	# function returns the nutri_value for a food given a nutri_attribute
	# returns 0.0 if no value associated with attribute
	def find_nutri_values_for_attribute(attribute)
		val = nutri_values.select{ |nv| nv.nutri_attribute.name == "#{attribute}"}
		if val.empty?
			return 0.0
		else
			val.first.value
		end
	end

end

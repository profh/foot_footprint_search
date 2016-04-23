# require needed files
require './test/sets/foods'
require './test/sets/enviro_types'
require './test/sets/enviro_values'
require './test/sets/nutri_attributes'
require './test/sets/nutri_values'
require './test/sets/plates'
require './test/sets/meals'



# explicitly include all sets of contexts used for testing 
module Contexts
  include Contexts::Foods
  include Contexts::EnviroTypes
  include Contexts::EnviroValues
  include Contexts::NutriAttributes
  include Contexts::NutriValues
  include Contexts::Plates
  include Contexts::Meals
end
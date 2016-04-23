module Contexts
  module Meals
    # Context for meals
    def create_meals
    	@meal1 = Meal.new("Breakfast", {@plate1 => 0.25, @plate2=> 0.25, @plate3 => 0.25, @plate4 => 0.25})
    	@meal2 = Meal.new("Breakfast", {@plate1 => 0.50, @plate2 => 0.55})
    	@meal3 = Meal.new("Breakfast", {@plate3 => 0.50, @plate4 => 0.50})
    end

    def destroy_meals
    	@meal1 = nil
    	@meal2 = nil
    	@meal3 = nil
    end

  end

end


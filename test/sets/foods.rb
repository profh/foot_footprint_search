module Contexts
  module Foods
    # Context for foods
    def create_foods
      @apple  = FactoryGirl.create(:food, name: "apple", serving_description: "1 medium apple")
      @banana = FactoryGirl.create(:food, name: "banana", serving_description: "1 medium banana", active: false)
      @pie    = FactoryGirl.create(:food, name: "pie", serving_description: "1 slice")
      @pizza  = FactoryGirl.create(:food, name: "pizza", serving_description: "1 slice")
    end
    
    def destroy_foods
      @apple.delete
      @banana.delete
      @pie.delete
      @pizza.delete
    end

  end

end


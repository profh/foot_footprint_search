module Contexts
  module EnviroValues
    # Context for enviro_totals
    def create_enviro_values
      # Energy
      @apple_energy_total = FactoryGirl.create(:enviro_value,
        food: @apple,
        enviro_type: @energy,
        value: 1.0)
      @banana_energy_total = FactoryGirl.create(:enviro_value,
        food: @banana,
        enviro_type: @energy,
        value: 2.0)
      @pie_energy_total = FactoryGirl.create(:enviro_value,
        food: @pie,
        enviro_type: @energy,
        value: 3.0)
      @pizza_energy_total = FactoryGirl.create(:enviro_value,
        food: @pizza,
        enviro_type: @energy,
        value: 4.0)
      # Blue Water
      @apple_blue_total = FactoryGirl.create(:enviro_value,
        food: @apple,
        enviro_type: @blue,
        value: 1.0)
      @banana_blue_total = FactoryGirl.create(:enviro_value,
        food: @banana,
        enviro_type: @blue,
        value: 2.0)
      @pie_blue_total = FactoryGirl.create(:enviro_value,
        food: @pie,
        enviro_type: @blue,
        value: 3.0)
      @pizza_blue_total = FactoryGirl.create(:enviro_value,
        food: @pizza,
        enviro_type: @blue,
        value: 4.0)
      # Green Water
      @apple_green_total = FactoryGirl.create(:enviro_value,
        food: @apple,
        enviro_type: @green,
        value: 1.0)
      @banana_green_total = FactoryGirl.create(:enviro_value,
        food: @banana,
        enviro_type: @green,
        value: 2.0)
      @pie_green_total = FactoryGirl.create(:enviro_value,
        food: @pie,
        enviro_type: @green,
        value: 3.0)
      @pizza_green_total = FactoryGirl.create(:enviro_value,
        food: @pizza,
        enviro_type: @green,
        value: 4.0)
      # Grey Water
      @apple_grey_total = FactoryGirl.create(:enviro_value,
        food: @apple,
        enviro_type: @grey,
        value: 1.0)
      @banana_grey_total = FactoryGirl.create(:enviro_value,
        food: @banana,
        enviro_type: @grey,
        value: 2.0)
      @pie_grey_total = FactoryGirl.create(:enviro_value,
        food: @pie,
        enviro_type: @grey,
        value: 3.0)
      @pizza_grey_total = FactoryGirl.create(:enviro_value,
        food: @pizza,
        enviro_type: @grey,
        value: 4.0)
      # GHG Emissions
      @apple_ghg_total = FactoryGirl.create(:enviro_value,
        food: @apple,
        enviro_type: @ghg,
        value: 1.0)
      @banana_ghg_total = FactoryGirl.create(:enviro_value,
        food: @banana,
        enviro_type: @ghg,
        value: 2.0)
      @pie_ghg_total = FactoryGirl.create(:enviro_value,
        food: @pie,
        enviro_type: @ghg,
        value: 3.0)
      @pizza_ghg_total = FactoryGirl.create(:enviro_value,
        food: @pizza,
        enviro_type: @ghg,
        value: 4.0)
    end
    
    def destroy_enviro_values
      @apple_energy_total.delete
      @banana_energy_total.delete
      @pie_energy_total.delete
      @pizza_energy_total.delete
      @apple_blue_total.delete
      @banana_blue_total.delete
      @pie_blue_total.delete
      @pizza_blue_total.delete
      @apple_green_total.delete
      @banana_green_total.delete
      @pie_green_total.delete
      @pizza_green_total.delete
      @apple_grey_total.delete
      @banana_grey_total.delete
      @pie_grey_total.delete
      @pizza_grey_total.delete
      @apple_ghg_total.delete
      @banana_ghg_total.delete
      @pie_ghg_total.delete
      @pizza_ghg_total.delete
    end

  end

end
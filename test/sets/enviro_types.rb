module Contexts
  module EnviroTypes
    # Context for enviro_types
    def create_enviro_types
      @energy = FactoryGirl.create(:enviro_type,
        name: "Energy",
        units: "MJ")
      @ghg = FactoryGirl.create(:enviro_type,
        name: "GHG Emissions",
        units: "kgCO2e")
      @blue = FactoryGirl.create(:enviro_type,
        name: "Blue Water",
        units: "Liters",
        active: false)
      @green = FactoryGirl.create(:enviro_type,
        name: "Green Water",
        units: "Liters",
        active: false)
      @grey = FactoryGirl.create(:enviro_type,
        name: "Grey Water",
        units: "Liters",
        active: false)
    end
    
    def destroy_enviro_types
      @energy.delete
      @ghg.delete
      @blue.delete
      @green.delete
      @grey.delete
    end

  end
  
end
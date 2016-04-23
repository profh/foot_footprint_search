namespace :db do
  desc "Erase and fill database"
  task :data => :environment do
    
    # STEP 1: read food data from file
    foods = Hash.new
    file_name_path = "#{File.expand_path(File.dirname(__FILE__))}/ffp_data.csv"
    food_file = File.open(file_name_path)
    

    # STEP 2: now add the foods to the db
    food_file.each_line do |line|
      # temp1 & temp2 are for client and will not be included in database
      # need to add tags attribute in Food
      f_name, f_serving, temp1, temp2, f_description, f_tags, na_cal, na_g, na_fat, na_sat_fat, 
      na_trans_fat, na_cholesterol, na_sodium, na_carbs, na_fiber, na_sugar, na_protein, na_vita, 
      na_vitc, na_calcium, na_iron, ev_energy, ev_blue, ev_green, ev_grey, ev_ghg = line.split(",")
      
      attributes = [["Calories", na_cal],["Grams", na_g],["Total Fat", na_fat], ["Saturated Fat", na_sat_fat],
                    ["Trans Fat", na_trans_fat], ["Cholesterol", na_cholesterol], ["Sodium", na_sodium], 
                    ["Total Carbs", na_carbs], ["Dietary Fiber", na_fiber], ["Sugar", na_sugar], ["Protein", na_protein],
                    ["Vitamin A", na_vita], ["Vitamin C", na_vitc], ["Calcium", na_calcium], ["Iron", na_iron]]
      etypes = [["Energy", ev_energy], ["Blue Water", ev_blue], ["Green Water", ev_green],
                ["Grey Water", ev_grey], ["GHG Emissions", ev_ghg]]

      food = Food.new
      food.name = f_name
      food.serving_description = f_serving
      food.food_description = f_description
      food.save!

      15.times do |i|
        nutri_value = NutriValue.new
        nutri_value.food_id = Food.find_by_name(f_name).id
        nutri_value.nutri_attribute_id = NutriAttribute.find_by_name(attributes[i][0]).id
        nutri_value.value = attributes[i][1]
        nutri_value.save!
      end

      5.times do |i|
        enviro_value = EnviroValue.new
        enviro_value.food_id = Food.find_by_name(f_name).id
        enviro_value.enviro_type_id = EnviroType.find_by_name(etypes[i][0]).id
        enviro_value.value = etypes[i][1]
        enviro_value.save!
      end
    end
  end
end
namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate and db:tickets to get tickets
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    # Rake::Task['db:test:prepare'].invoke

    # Step 1: Create NutriAttributes
    all_attributes = [
      ["Calories", "calories"],
      ["Grams", "g"],
      ["Total Fat", "g"],
      ["Saturated Fat", "g"],
      ["Trans Fat", "g"],
      ["Cholesterol", "mg"],
      ["Sodium", "mg"],
      ["Total Carbs", "g"],
      ["Dietary Fiber", "g"],
      ["Sugar", "g"],
      ["Protein", "g"],
      ["Vitamin A", "%"],
      ["Vitamin C", "%"],
      ["Calcium", "%"],
      ["Iron", "%"]
    ]

    all_attributes.each do |attribute|
      na = NutriAttribute.new
      na.name = attribute[0]
      na.units = attribute[1]
      na.active = true
      na.save!
    end

    # Step 2: Create EnviroTypes
    all_types = [
      ["Energy", "MJ"],
      ["Blue Water", "Liters"],
      ["Green Water", "Liters"],
      ["Grey Water", "Liters"],
      ["GHG Emissions", "kg/CO2e"]
    ]

    all_types.each do |etype|
      et = EnviroType.new
      et.name = etype[0]
      et.units = etype[1]
      et.active = true
      et.save!
    end

    # Step 3: Enter Data
    Rake::Task['db:data'].invoke
    
  end
end





class Importer

	attr_accessor :file
	attr_reader :f_data

	def initialize(file)
		@file = file
	end


	def import_csv_data
		# rows is 2D array
		rows = open_file_as_csv
		unless rows == false
			rows.each do |row|
				create_food(row)
				set_nutri_values(row)
				set_enviro_values(row)
			end
		end
	end


	def import_excel_data
		# will write
	end


	private
	def open_file_as_csv
		return false if file.nil?
		@f_data = Array.new
		food_data = Roo::Spreadsheet.open(file, extension: :csv)
		food_data.each_with_pagename do |name, sheet|
		  food_data.last_row.times do |i|
		  	# rows start at 1 but array starts at 0
		  	# row 1 (array[0]) is the header that we don't want
		  	@f_data << sheet.row(i+1) unless i == 0
		  end
		end
		@f_data
	end


	def create_food(data)
		read_data(data)
		food = Food.new
		food.name = @f_name
    food.serving_description = @f_serving
    food.food_description = @f_description
    food.tags = @f_tags
    food.save!
	end


	def set_nutri_values(data)
		read_data(data)
		attributes = [["Calories", @na_cal],["Grams", @na_g],["Total Fat", @na_fat], ["Saturated Fat", @na_sat_fat],
                    ["Trans Fat", @na_trans_fat], ["Cholesterol", @na_cholesterol], ["Sodium", @na_sodium], 
                    ["Total Carbs", @na_carbs], ["Dietary Fiber", @na_fiber], ["Sugar", @na_sugar], ["Protein", @na_protein],
                    ["Vitamin A", @na_vita], ["Vitamin C", @na_vitc], ["Calcium", @na_calcium], ["Iron", @na_iron]]
    15.times do |i|
      nutri_value = NutriValue.new
      nutri_value.food_id = Food.find_by_name(@f_name).id
      nutri_value.nutri_attribute_id = NutriAttribute.find_by_name(attributes[i][0]).id
      nutri_value.value = attributes[i][1]
      nutri_value.save!
    end
	end


	def set_enviro_values(data)
		read_data(data)
		etypes = [["Energy", @ev_energy], ["Blue Water", @ev_blue], ["Green Water", @ev_green],
                ["Grey Water", @ev_grey], ["GHG Emissions", @ev_ghg]]
    5.times do |i|
      enviro_value = EnviroValue.new
      enviro_value.food_id = Food.find_by_name(@f_name).id
      enviro_value.enviro_type_id = EnviroType.find_by_name(etypes[i][0]).id
      enviro_value.value = etypes[i][1]
      enviro_value.save!
     end
	end


	def read_data(data)
		@f_name = data[1]
		@f_serving = data[2]
		# data[3] and data[4] are columns for client
		@f_description = data[5]
		@f_tags = data[6].split(', ')
		@na_cal = data[7].to_f
		@na_g = data[8].to_f
		@na_fat = data[9].to_f
		@na_sat_fat = data[10].to_f
		@na_trans_fat = data[11].to_f
		@na_cholesterol = data[12].to_f
		@na_sodium = data[13].to_f
		@na_carbs = data[14].to_f
		@na_fiber = data[15].to_f
		@na_sugar = data[16].to_f
		@na_protein = data[17].to_f
		@na_vita = data[18].to_f
		@na_vitc = data[19].to_f
		@na_calcium = data[20].to_f
		@na_iron = data[21].to_f
		@ev_energy = data[22].to_f
		@ev_blue = data[23].to_f
		@ev_green= data[24].to_f
		@ev_grey = data[25].to_f
		@ev_ghg = data[26].to_f
	end

end





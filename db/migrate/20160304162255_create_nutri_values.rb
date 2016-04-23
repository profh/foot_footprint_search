class CreateNutriValues < ActiveRecord::Migration
  def change
    create_table :nutri_values do |t|
      t.references :food
      t.references :nutri_attribute
      t.float :value, default: true

      # t.timestamps null: false
    end
  end
end

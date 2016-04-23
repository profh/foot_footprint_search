class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :food_description
      t.string :serving_description
      t.boolean :active, default: true

      # t.timestamps null: false
    end
  end
end

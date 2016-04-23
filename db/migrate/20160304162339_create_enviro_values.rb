class CreateEnviroValues < ActiveRecord::Migration
  def change
    create_table :enviro_values do |t|
      t.references :food
      t.references :enviro_type
      t.float :value

      # t.timestamps null: false
    end
  end
end

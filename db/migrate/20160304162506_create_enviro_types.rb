class CreateEnviroTypes < ActiveRecord::Migration
  def change
    create_table :enviro_types do |t|
      t.string :name
      t.string :units
      t.boolean :active, default: true

      # t.timestamps null: false
    end
  end
end

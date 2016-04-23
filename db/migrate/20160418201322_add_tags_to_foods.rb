class AddTagsToFoods < ActiveRecord::Migration
  def change
  	# adding migration file to edit database
  	# adds new column called tags to Foods
  	# t.text :tags, array: true, default: []
  	add_column :foods, :tags, :text, array: true, default: []
  end
end

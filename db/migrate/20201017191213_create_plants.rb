class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name 
      t.text :description
      t.datetime :water
      t.integer :user_id
    end
  end
end

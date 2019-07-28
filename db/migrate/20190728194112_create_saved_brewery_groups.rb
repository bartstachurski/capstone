class CreateSavedBreweryGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_brewery_groups do |t|
      t.integer :saved_brewery_id
      t.integer :group_id

      t.timestamps
    end
  end
end

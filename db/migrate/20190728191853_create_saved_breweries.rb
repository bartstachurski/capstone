class CreateSavedBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_breweries do |t|
      t.integer :user_id
      t.string :brewery_id
      t.boolean :visited
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end

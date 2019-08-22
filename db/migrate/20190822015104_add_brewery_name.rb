class AddBreweryName < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_breweries, :brewery_name, :string
  end
end
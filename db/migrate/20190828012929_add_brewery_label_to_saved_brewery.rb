class AddBreweryLabelToSavedBrewery < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_breweries, :brewery_label, :string
  end
end

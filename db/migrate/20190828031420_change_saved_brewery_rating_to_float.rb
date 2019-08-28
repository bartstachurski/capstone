class ChangeSavedBreweryRatingToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :saved_breweries, :rating, :float
  end
end

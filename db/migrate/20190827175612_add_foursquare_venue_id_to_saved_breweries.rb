class AddFoursquareVenueIdToSavedBreweries < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_breweries, :foursquare_venue_id, :string
    add_column :saved_breweries, :untappd_brewery_id, :string
    rename_column :saved_breweries, :brewery_id, :untappd_venue_id
  end
end

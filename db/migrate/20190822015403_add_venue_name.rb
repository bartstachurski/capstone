class AddVenueName < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_breweries, :venue_name, :string
  end
end

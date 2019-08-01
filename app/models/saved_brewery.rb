class SavedBrewery < ApplicationRecord
  belongs_to :user
  belongs_to :brewery
  has_many :saved_brewery_groups
  has_many :groups, through: :saved_brewery_groups
end

class SavedBreweryGroup < ApplicationRecord
  belongs_to :saved_brewery
  belongs_to :group
end

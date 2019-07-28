class SavedBrewery < ApplicationRecord
  belongs_to :user, :brewery
end

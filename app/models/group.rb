class Group < ApplicationRecord
  has_many :saved_brewery_groups
  has_many :saved_breweries, through: :saved_brewery_groups
  belongs_to :user
  has_many :shared_groups
  has_many :users, through: :shared_groups
end

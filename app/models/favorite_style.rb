class FavoriteStyle < ApplicationRecord
  has_many :styles
  belongs_to :users
end

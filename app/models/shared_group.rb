class SharedGroup < ApplicationRecord
  # has_many :users, through: :groups
  belongs_to :group
  belongs_to :user
end

class AddForeignKeyToFriendships < ActiveRecord::Migration[6.0]
  def change
    remove_column :friendships, :user_id, :integer
    remove_column :friendships, :friend_id, :integer
    add_reference :friendships, :user, index: true, foreign_key: true
    add_reference :friendships, :friend, index: true
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
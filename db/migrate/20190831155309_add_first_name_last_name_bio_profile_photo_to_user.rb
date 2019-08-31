class AddFirstNameLastNameBioProfilePhotoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :profile_photo, :string
    rename_column :users, :name, :first_name
  end
end

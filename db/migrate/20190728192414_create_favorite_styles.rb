class CreateFavoriteStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_styles do |t|
      t.integer :user_id
      t.integer :style_id

      t.timestamps
    end
  end
end

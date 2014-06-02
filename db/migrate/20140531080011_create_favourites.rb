class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.string :title
      t.integer :account_id
      t.integer :favourite_category_id
      t.integer :favourite_preset_id
      t.has_attached_file :photo

      t.timestamps
    end
    add_index :favourites, :favourite_category_id
    add_index :favourites, :account_id
  end
end

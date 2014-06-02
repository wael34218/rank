class CreateFavouritePresets < ActiveRecord::Migration
  def change
    create_table :favourite_presets do |t|
      t.string :title
      t.integer :favourite_category_id
      t.has_attached_file :photo

      t.timestamps
    end
    add_index :favourite_presets, :favourite_category_id
  end
end

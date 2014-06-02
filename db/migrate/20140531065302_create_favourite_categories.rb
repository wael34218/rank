class CreateFavouriteCategories < ActiveRecord::Migration
  def change
    create_table :favourite_categories do |t|
      t.string :title
      t.has_attached_file :photo

      t.timestamps
    end
  end
end

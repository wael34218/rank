class CreateMomentCategories < ActiveRecord::Migration
  def change
    create_table :moment_categories do |t|
      t.string :text
      t.has_attached_file :photo

      t.timestamps
    end
  end
end

class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :account_id
      t.integer :activity_id

      t.timestamps
    end
    add_index :likes, :account_id
    add_index :likes, :activity_id
    rename_column :activities, :votes_count, :likes_count
  end
end

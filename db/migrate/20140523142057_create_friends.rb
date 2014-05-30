class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :account_id
      t.integer :friend_id
      t.integer :rank
      t.integer :bond, default: 0

      t.timestamps
    end
    add_index :friends, :account_id
    add_index :friends, :friend_id

  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.integer :activity_id
      t.integer :account_id

      t.timestamps
    end
    add_index :comments, :activity_id
    add_index :comments, :account_id
  end
end

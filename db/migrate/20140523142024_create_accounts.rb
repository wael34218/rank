class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.integer :social_score, default: 0
      t.string :token
      t.boolean :registered, default: false
      t.string :phone
      t.integer :moves_count, default: 0
      t.integer :joker_count, default: 0
      t.has_attached_file :avatar

      t.timestamps
    end
    add_index :accounts, :phone
  end
end

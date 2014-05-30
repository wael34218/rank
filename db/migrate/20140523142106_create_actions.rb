class CreateActions < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :subject_id
      t.integer :type, default: 0
      t.integer :target_id
      t.string :message
      t.integer :votes_count, default: 0
      t.integer :comments_count, default: 0
      t.hstore  :data
      t.has_attached_file :photo

      t.timestamps
    end
    add_index :activities, :subject_id
    add_index :activities, :target_id
    add_index :activities, :type
    execute "CREATE INDEX activities_gin_data ON activities USING GIN(data)"
  end
end

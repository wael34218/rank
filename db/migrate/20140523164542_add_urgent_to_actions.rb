class AddUrgentToActions < ActiveRecord::Migration
  def change
    add_column :activities, :urgent, :boolean, :default => false
    add_index :activities, :urgent
  end
end

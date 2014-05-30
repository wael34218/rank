class AddSocialScoreToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :social_score, :integer, default: 0
  end
end

class Like < ActiveRecord::Base
  belongs_to :account
  belongs_to :activity

  validates_uniqueness_of :account_id, :scope => :activity_id

  after_save :adjust_bonds

  private

  def adjust_bonds
    activity = self.activity
    friendship = activity.subject.friendship(activity.target)
    if friendship.present?
      friendship.bond += CONSTANTS::LIKE_BOND
      friendship.save
    end
    
    friendship = activity.target.friendship(activity.subject)
    if friendship.present?
      friendship.bond += CONSTANTS::LIKE_BOND
      friendship.save
    end
  end
end

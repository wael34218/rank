class Friend < ActiveRecord::Base
  belongs_to :account
  belongs_to :friend, class_name: "Account"

  after_initialize :defaults
  before_save :update_friend_social_score

  private

  def defaults
    if self.new_record?
      self.bond = CONSTANTS::FRIEND_DEFAULT_BOND
    end
  end

  def update_friend_social_score
    return if self.rank == self.rank_was
    if self.rank.present?
      self.social_score = CONSTANTS::FRIEND_DEFAULT_SOCIAL_SCORE + 
        (self.account.social_score / (self.rank+1))
    else
      self.social_score = CONSTANTS::FRIEND_DEFAULT_SOCIAL_SCORE +
        (self.account.social_score / 100)
    end
    promoted_account = self.friend
    promoted_account.social_score = promoted_account.social_score + self.social_score - self.social_score_was
    promoted_account.save
  end
end

class Activity < ActiveRecord::Base
  enum activity_type: [:message, :moment, :ranking]
  belongs_to :subject, class_name: "Account"
  belongs_to :target, class_name: "Account"
  has_many :comments
  has_many :likes
  
  validates :subject_id, presence: true
  validates :target_id, presence: true

  has_attached_file :photo,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_photo_:style.png"

  scope :for, -> (account){where(["subject_id in (?) or target_id in (?)",account.friend_ids, account.friend_ids])}
  scope :prioritize, -> {
    select("*, EXTRACT(EPOCH FROM (updated_at - now())/60) + 10*comments_count + 5*likes_count as priority").
    order("urgent, priority")
  }

  def add_comment(account_id, message)
    Comment.create(activity_id: self.id, account_id: account_id, message: message)
    self.comments_count = self.comments_count + 1
    self.save
  end

  def add_like(account_id)
    like = Like.new(activity_id: self.id, account_id: account_id)
    if like.save
      self.likes_count = self.likes_count + 1
      self.save
      return true
    else
      return false
    end
  end

  def method_missing(meth, *args, &block)
    # TODO: should handle associations in a better way
    if self.read_attribute(:data).keys.include?(meth.to_s)
      self.read_attribute(:data)[meth.to_s]
    elsif meth.to_s == "ranked"
      Account.find(self.read_attribute(:data)["ranked_id"])
    elsif meth.to_s == "moment_category"
      MomentCategory.find(self.read_attribute(:data)["moment_category_id"])
    else
      super 
    end
  end
end

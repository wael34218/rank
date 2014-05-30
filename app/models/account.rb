class Account < ActiveRecord::Base
  validates :phone, presence: true, uniqueness: true

  has_many :friends
  has_many :activities, foreign_key: "subject_id"
  has_many :comments

  acts_as_taggable
  
  scope :ordered_by_rank, ->(rank) {
    order("CASE #{rank.map.with_index{|id,i| "WHEN id=#{id} THEN #{i}"}.join(" ")} end").where(id: rank)
  }
  
  has_attached_file :avatar,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_avatar_:style.png"

  def generate_token!
    self.registered = true
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def friend_ids
    self.friends.pluck(:id) << self.id
  end

  def friends_with?(friend_account)
    Friend.where(account_id: self.id, friend_id: friend_account.id).present?
  end

  def friendship(friend_account)
    Friend.where(account_id: self.id, friend_id: friend_account.id).first
  end

  def reorder_friend!(friend_account, new_rank)
    old_rank = self.friendship(friend_account).rank
    friend_ids = Friend.where(:account_id=>self.id).order("rank asc").pluck(:id)
    friend_ids = friend_ids.insert(new_rank - 1, friend_ids.delete_at(old_rank - 1))
    friend_ids.each_with_index do |id, i|
      friend = Friend.update(id, rank: (i+1))
    end
  end
end

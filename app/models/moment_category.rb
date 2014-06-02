class MomentCategory < ActiveRecord::Base
  has_many :moments

  has_attached_file :photo,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_avatar_:style.png"

  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end

class MomentCategory < ActiveRecord::Base

  has_attached_file :photo,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_avatar_:style.png"
end

class FavouritePreset < ActiveRecord::Base
  belongs_to :favourite_category
  has_many :favourites

  validate :valid_favourite_category_id

  has_attached_file :photo,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_avatar_:style.png"

  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def display_title
    title
  end

  def display_photo
    photo
  end

  private

  def valid_favourite_category_id
    if not FavouriteCategory.exists?(self.favourite_category_id)
      errors.add(:favourite_category_id, "Category does not exist! Stop the madness!") 
    end
  end
end

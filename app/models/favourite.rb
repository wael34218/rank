class Favourite < ActiveRecord::Base
  belongs_to :favourite_category
  belongs_to :favourite_preset

  validate :valid_favourite_category_id
  validate :valid_favourite_preset_id

  before_save :get_category_from_preset

  scope :for_account, ->(p){ where(:account_id=>p) if p.present?}
  scope :for_favourite_category, ->(p){ where(:favourite_category_id=>p) if p.present?}
  scope :search, ->(args) { for_account(args[:account_id]).for_favourite_category(args[:favourite_category_id]) }

  has_attached_file :photo,
    :styles => {:small => "80x80>", :medium => "160x160>", :large=>"300x300>"},
    :default_url => "/images/default_avatar_:style.png"

  def display_title
    if self.favourite_preset_id.present?
      self.favourite_preset.title
    else
      self.title
    end
  end

  def display_photo
    if self.favourite_preset_id.present?
      self.favourite_preset.photo
    else
      self.photo
    end
  end

  private

  def get_category_from_preset
    if self.favourite_preset_id.present?
      self.favourite_category_id = FavouritePreset.find(self.favourite_preset_id).favourite_category_id
    end
  end

  def valid_favourite_category_id
    if self.favourite_preset_id.blank?
      if not FavouriteCategory.exists?(self.favourite_category_id)
        errors.add(:favourite_category_id, "Category does not exist! Stop the madness!") 
      end
    end
  end

  def valid_favourite_preset_id
    if self.favourite_preset_id.present? and not FavouritePreset.exists?(self.favourite_preset_id)
      errors.add(:favourite_preset_id, "Preset does not exist! Stop the madness!") 
    end
  end

end

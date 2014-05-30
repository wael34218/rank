class Moment < Activity
  after_initialize :defaults

  store_accessor :data, :moment_category_id

  validate :valid_moment_category_id

  # This function acts like belongs_to association
  def moment_category
    MomentCategory.find(self.moment_category_id)
  end

  private

  def valid_moment_category_id
    if not MomentCategory.exists?(self.moment_category_id)
      errors.add(:moment_category_id, "Category does not exist! Stop the madness!") 
    end
  end

  def defaults
    if self.new_record?
      self.activity_type = Activity.activity_types["message"]
    end
  end
end

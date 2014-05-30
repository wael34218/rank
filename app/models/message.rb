class Message < Activity
  after_initialize :defaults

  store_accessor :data, :private

  validates :message, presence: true

  private

  def defaults
    if self.new_record?
      self.activity_type = Activity.activity_types["message"]
      self.private ||= false
    end
  end
end

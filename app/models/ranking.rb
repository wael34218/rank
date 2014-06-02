class Ranking < Activity
  after_initialize :defaults

  store_accessor :data, :tool, :status, :ranked_id, :previous_rank, :new_rank, :rank_change, :yes, :no, :yes_ids, :no_ids

  STATUSES = [:pending, :approved, :rejected]
  TOOLS = [:suggest, :force, :joker, :bribe]

  validates :ranked_id, presence: true
  validate :valid_friendship
  validate :valid_eligibility

  # This function acts like belongs_to association
  def ranked
    Account.find(self.ranked_id)
  end

  def yes_ids_array
    return [] if self.yes_ids.blank?
    self.yes_ids.split(",").map(&:to_i)
  end

  def no_ids_array
    return [] if self.no_ids.blank?
    self.no_ids.split(",").map(&:to_i)
  end

  def vote_yes!(account_id)
    if not yes_ids_array.include?(account_id)
      if no_ids_array.include?(account_id)
        self.yes_ids = yes_ids_array.push(account_id).join(",")
        self.yes = self.yes.to_i + 1
        self.no_ids = (no_ids_array - [account_id]).join(",")
        self.no= self.no.to_i - 1
      else
        self.yes_ids = yes_ids_array.push(account_id).join(",")
        self.yes = self.yes.to_i + 1
      end
    end
    self.save
  end

  def vote_no!(account_id)
    if not no_ids_array.include?(account_id)
      if yes_ids_array.include?(account_id)
        self.no_ids = no_ids_array.push(account_id).join(",")
        self.no = self.no.to_i + 1
        self.yes_ids = (yes_ids_array - [account_id]).join(",")
        self.yes = self.yes.to_i - 1
      else
        self.no_ids = no_ids_array.push(account_id).join(",")
        self.no = self.no.to_i + 1
      end
    end
    self.save
  end

  def approve!
    friendship = self.target.friendship(self.ranked)
    new_rank = self.new_rank
    if new_rank.blank?
      new_rank = friendship.rank - self.rank_change.to_i
    end
    self.target.reorder_friend!(self.ranked, new_rank)
    self.status = STATUSES.index(:approved)
    self.urgent = false
    self.save
  end

  def reject!
    self.status = STATUSES.index(:rejected)
    self.urgent = false
    self.save
  end

  private

  def defaults
    if self.new_record?
      self.activity_type = Activity.activity_types["ranking"]
      if [TOOLS.index(:suggest), TOOLS.index(:bribe)].include?(self.tool.to_i)
        self.status = STATUSES.index(:pending)
      else
        self.status = STATUSES.index(:approved)
      end

      self.tool = TOOLS.index(self.tool.to_sym) unless self.tool.match(/^\d$/)
      self.tool ||= TOOLS.index(:suggest)

      self.yes ||= 0
      self.no ||= 0

      if self.status == STATUSES.index(:pending)
        self.urgent = true
      end
    end
  end

  def valid_friendship
    if not self.target.friends_with?(self.subject) and (self.subject_id != self.target_id)
      errors.add(:friendship, "Dude! Do not mess with someone that does not like you!")
    end
  end

  def valid_eligibility
    case self.tool.to_i
    when TOOLS.index(:suggest)
      friendship = self.subject.friendship(self.target)
      if friendship.blank? or friendship.bond < CONSTANTS::SUGGEST_BOND
        errors.add(:eligibility, "Not enough bonds to suggest change")
      end
    when TOOLS.index(:force)
      friendship = self.subject.friendship(self.target)
      if friendship.blank? or friendship.bond < CONSTANTS::FORCE_BOND
        errors.add(:eligibility, "Not enough bonds to force change")
      end
    when TOOLS.index(:joker)
      if self.subject_id == self.target_id
        if self.subject.joker_count < 1
          errors.add(:eligibility, "You do not have Jokers yet")
        end
      else
        errors.add(:eligibility, "You can only use the Joker on yourself ;)")
      end
    when TOOLS.index(:bribe)
    end
  end
end

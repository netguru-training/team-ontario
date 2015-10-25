class User < ActiveRecord::Base
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :family
  has_many :kid_events
  has_many :events, through: :kid_events
  has_many :comments
  has_many :kid_scores


  scope :kids_belonging_to_family, -> (family_id) { where("family_id = ?", family_id).with_role(:kid) }

  def add_to_total_score (amount)
    self.total_score += amount
  end

  def subtract_from_total_score (amount)
    self.total_score -= amount
  end

  def score
    sum = 0
    self.events.each do |event|
      event.events_type.name == 'duty' ? sum += event.points : sum -= event.points
    end
    sum
  end

end

class Event < ActiveRecord::Base
  belongs_to :family
  belongs_to :events_type
  validates_presence_of :name, :points
  has_many :kid_events
  has_many :users, through: :kid_events
end

class EventsType < ActiveRecord::Base
  has_many :events
  has_many :kid_events, through: :events
  validates_presence_of :name
end

class Event < ActiveRecord::Base
  belongs_to :family
  belongs_to :event_type
  validates_presence_of :name, :points
end

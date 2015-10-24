class Event < ActiveRecord::Base
  belongs_to :family
  belongs_to :event_type
end

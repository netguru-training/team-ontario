class Comment < ActiveRecord::Base
  belongs_to :kid_event
  belongs_to :user
end

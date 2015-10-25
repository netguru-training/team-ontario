class KidScore < ActiveRecord::Base
  belongs_to :user
  validate_presence_of :name, :user_id
end

class Family < ActiveRecord::Base

  has_many :users

  validates :name, presence: true

  has_many :events

end

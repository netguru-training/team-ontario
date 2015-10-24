class Family < ActiveRecord::Base

  has_many :users
<<<<<<< HEAD

=======
  has_many :events
>>>>>>> Add Family reference to Event
  validates :name, presence: true

  has_many :events

end

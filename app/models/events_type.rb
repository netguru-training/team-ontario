class EventsType < ActiveRecord::Base
  has_many :events
  validates_presence_of :name


  def color

    if self.name == "punishment"
      "danger"
    elsif self.name == "award"
      "success"
    else self.name == "duty"
      "info"
    end
  end
end

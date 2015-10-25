class KidEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :comments


  def decreasing_points?
    decreasing_types = ['punishment', 'duty']
    decreasing_types.include?(self.event.events_type.id)
  end

  def done?
    self.done ? "glyphicon glyphicon-ok" : "glyphicon glyphicon-remove"
  end
end

class KidEventDecorator < Draper::Decorator
  delegate_all

  def done?
    self.done ? "glyphicon glyphicon-ok" : "glyphicon glyphicon-remove"
  end

end

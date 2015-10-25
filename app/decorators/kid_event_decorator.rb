class KidEventDecorator < Draper::Decorator
  delegate_all

  def done?
    self.done ? "glyphicon glyphicon-ok" : "glyphicon glyphicon-remove"
  end

  def author_name
    self.user.name
  end

end

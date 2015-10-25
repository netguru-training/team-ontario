class EventsTypeDecorator < Draper::Decorator
  delegate_all

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

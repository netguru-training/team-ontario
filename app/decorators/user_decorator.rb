class UserDecorator < Draper::Decorator
  delegate_all

  def show_total_score
    user.score || 0
  end
end

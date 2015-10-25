class KidPanelController < ApplicationController
  expose(:user) { current_user }
  expose(:events) { Event.joins(:kid_events).where('user_id = ?', current_user.id) }

  before_action :authenticate_user!, :verify_parent_role

  def verify_parent_role
    redirect_to(root_path, alert: "Grow up!") if current_user.has_role?(:parent)
  end
end

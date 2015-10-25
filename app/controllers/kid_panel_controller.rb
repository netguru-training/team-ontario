class KidPanelController < ApplicationController
  expose(:family_members) { current_user.family.users.select { |user| user != current_user } }
  expose(:event) { Event.new }
  expose(:events_types) { EventsType.all }

  before_action :authenticate_user!, :verify_parent_role

  def verify_parent_role
    redirect_to(root_path, alert: "TODO") if current_user.has_role?(:parent)
  end
end

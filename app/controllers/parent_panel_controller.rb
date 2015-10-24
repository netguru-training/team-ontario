class ParentPanelController < ApplicationController
  expose(:family_members) { current_user.family.users.select { |user| user != current_user } }
  expose(:event) { Event.new }
  expose(:events_types) { EventsType.all }

  before_action :authenticate_user!, :verify_parent_role

  def verify_parent_role
    redirect_to(root_path, alert: "Next time you'll be punished!") if current_user.has_role?(:kid)
  end
end

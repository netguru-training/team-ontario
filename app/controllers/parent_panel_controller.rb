class ParentPanelController < ApplicationController
  def index
    @family_members = current_user.family.users
  end
end

class VisitorsController < ApplicationController
  before_action :show_parent_panel

  def show_parent_panel
    if user_signed_in?
      redirect_to parent_panel_path if current_user.has_role?(:parent)
      redirect_to kid_panel_path if current_user.has_role?(:kid)
    end
  end
end

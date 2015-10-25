class KidEventsController < ApplicationController
  def new
  end

  def create
  end

  private

  def kid_event_params
    params.require(:kid_event).permit(TODO)
  end
end

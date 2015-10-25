class KidEventsController < ApplicationController
  expose(:kid_event)
  expose(:events) { Event.belonging_to_family @family_id }
  expose(:users) { User.kids_belonging_to_family @family_id }

  before_action :authenticate_user!
  before_action :set_family_id

  def new
  end

  def create

    event = Event.find(params[:event_id])
    kid_event = event.kid_events.create(kid_event_params)
    kid_event.done = true if kid_event.decreasing_points?

    if kid_event.save
      redirect_to user_path(User.find(params[:kid_event][:user_id])), notice: 'Kid Event was succesfully created'
    else
      render :new, warning: kid_event.errors.full_messages.to_sentence
    end
  end

  private

  def set_family_id
    @family_id ||= current_user.family_id
  end

  def kid_event_params
    params.require(:kid_event).permit(:user_id, :event_id)
  end
end

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
    params[:user_ids].each do |id|
      kid_event = event.kid_events.create(user_id: id, event_id: params[:event_id])
      kid_event.done = true if kid_event.decreasing_points?
    end

    if kid_event.save
      redirect_to events_path, notice: 'Kid Events was succesfully created'
    else
      render :new, warning: kid_event.errors.full_messages.to_sentence
    end
  end

  private

  def set_family_id
    @family_id ||= current_user.family_id
  end

end

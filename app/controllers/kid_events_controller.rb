class KidEventsController < ApplicationController
  expose(:kid_event)
  expose(:events) { Event.belonging_to_family @family_id }
  expose(:users) { User.kids_belonging_to_family @family_id }

  before_action :authenticate_user!
  before_action :set_family_id

  def new
  end

  def create
    self.kid_event = KidEvent.new(kid_event_params)
    self.kid_event.done = true if kid_event.decreasing_points?

    if kid_event.save
      redirect_to user_path(current_user), notice: 'Kid Event was succesfully created'
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

class EventsController < ApplicationController
  before_action :set_family_id, only: [:create, :update, :index]
  before_action :set_event, only: [:create, :update]

  expose(:events) { Event.belonging_to_family @family_id }
  expose(:event)
  expose(:events_types) {EventsType.all}

  def index
  end

  def new
  end

  def create
    if event.save
      redirect_to events_path, notice: 'Event was succesfully created'
    else
      render :new, warning: event.errors.full_messages.to_sentence

    end
  end

  def update
    if event.save
      redirect_to event_path(event), notice: 'Event was succesfully updated'
    else
      render :edit, warning: event.errors.full_messages.to_sentence
    end
  end

  def destroy
    event.destroy
    redirect_to events_path, notice: 'Event was succesfully deleted'
  end

  private

  def set_event
    self.event = Event.new(event_params.merge(family_id: @family_id))
  end

  def set_family_id
    @family_id ||= current_user.family_id
  end

  def event_params
    params.require(:event).permit(:name, :description, :points, :events_type_id).merge(family_id: @family_id)
  end
end

class EventsController < ApplicationController

  before_action :set_event, only: [:create, :update]
  before_action :set_family_id

  expose(:events) { Event.belonging_to_family @family_id }
  expose(:event)
  expose(:events_types) {EventsType.all}

  expose(:duties) { EventsType.find(3).events.where(family: current_user.family)}
  expose(:punishments) { EventsType.find(1).events.where(family: current_user.family)}
  expose(:awards) { EventsType.find(2).events.where(family: current_user.family)}

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

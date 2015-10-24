class EventsController < ApplicationController
  expose(:events, ancestor: :family)
  expose(:event, ancestor: :family)
  expose(:family)

  def create
    if event.save
      redirect_to event_path(event), notice: 'Event was succesfully created'
    else
      render :new
    end
  end

  def update
    if event.save
      redirect_to event_path(event), notice: 'Event was succesfully created'
    else
      render :edit
    end
  end

  def destroy
    event.destroy
    redirect_to events_path, notice: 'Event was succesfully deleted'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :points)
  end
end

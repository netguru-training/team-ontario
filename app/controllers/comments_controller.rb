class CommentsController < ApplicationController
  expose(:kid_event)
  expose(:comment)
  expose(:comments)

  before_action :authenticate_user!, only: :create

  def index
  end

  def new
  end

  def create
    self.comment = Comment.new(comment_params.merge(user_id: current_user.id))
    if comment.save
      redirect_to kid_event_comments_path(kid_event), notice: 'Event was succesfully created'
    else
      render :new, warning: event.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :kid_event_id)
  end
end

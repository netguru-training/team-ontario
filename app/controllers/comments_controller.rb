class CommentsController < ApplicationController
  expose(:comment)
  expose(:comments)

  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :kid_event_id)
  end
end

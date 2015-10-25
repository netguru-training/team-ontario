class UsersController < ApplicationController
  expose(:user, attributes: :user_params)


  def show
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end

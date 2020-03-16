class UsersController < ApplicationController
  before_action :set_user

  def user_account
    # render plain: params.inspect
    @user_account = User.find(params[:format])
  end

  def list
    @articles = User.find(current_user.id).articles
  end

  private

  def set_user
    @user ||= User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:id, :format)
  end
end

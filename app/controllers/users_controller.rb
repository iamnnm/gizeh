class UsersController < ApplicationController

  def list
    @articles = User.find(current_user.id).articles
  end

  private

  def set_user
    @user ||= Article.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:title, :post)
  end
end

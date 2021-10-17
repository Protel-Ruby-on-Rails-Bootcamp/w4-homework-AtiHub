class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(params[:user_id])
    @articles = @user.articles.publics
  end
end

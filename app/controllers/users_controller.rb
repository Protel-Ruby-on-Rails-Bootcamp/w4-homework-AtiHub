class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(params[:user_id])
    @articles = @user.articles.publics
  end

  def feed
    @user = User.find(params[:user_id])
    if @user != current_user
      redirect_to feed_path(current_user)
    end

    @articles = current_user.feed.order('created_at DESC')
  end
end

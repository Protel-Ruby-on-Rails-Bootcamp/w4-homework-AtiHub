class HomeController < ApplicationController
  def index
    @users = User.joins(:articles).group(:id).order('COUNT(user_id) DESC')
  end
end

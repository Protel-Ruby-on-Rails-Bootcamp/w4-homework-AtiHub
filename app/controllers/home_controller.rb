class HomeController < ApplicationController
  def index
    @articles = Article.all.publics.order('created_at DESC')
    @users = User.joins(:articles).group(:id)
  end
end

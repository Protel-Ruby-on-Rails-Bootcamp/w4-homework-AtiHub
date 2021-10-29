class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @articles = current_user.articles
    @comments = Comment.where("article_id IN (?)", current_user.article_ids).pending
  end
end

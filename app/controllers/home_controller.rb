class HomeController < ApplicationController
  def index
    @articles = Article.all.publics.order('created_at DESC')
  end
end

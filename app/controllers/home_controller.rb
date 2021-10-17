class HomeController < ApplicationController
  def index
    @articles = Article.all.publics
  end
end

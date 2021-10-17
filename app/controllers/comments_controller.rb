class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end
  
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.update!(user: current_user)

    redirect_to @article, notice: "Comment was successfully posted."
  end

  def accept
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update!(accepted: true)

    redirect_to article_comments_path, notice: "Comment was successfully accepted."
  end

  private
    
  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end

class CommentsController < ApplicationController
  before_action :set_article
  before_action :authenticate_user!

  def index
    @comments = @article.comments
  end
  
  def show
    @comment = @article.comments.find(params[:id])
  end
  
  def create
    @comment = @article.comments.create(comment_params)
    @comment.update!(user: current_user)

    redirect_to @article, notice: "Comment has successfully posted."
  end

  def accept
    @comment = @article.comments.find(params[:id])
    @comment.update!(accepted: true)

    redirect_to article_comments_path, notice: "Comment has successfully accepted."
  end

  def deny
    @comment = @article.comments.find(params[:id])
    @comment.update!(accepted: false)

    redirect_to article_comments_path, notice: "Comment has successfully denied."
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
    
  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end

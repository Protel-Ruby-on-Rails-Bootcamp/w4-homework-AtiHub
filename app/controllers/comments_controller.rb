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

    @comments = @article.comments.accepted.order('created_at DESC')
    @comments_pending = current_user.comments.non_accepted.order('created_at DESC')

    respond_to do |format|
      format.html { redirect_to @article, notice: "Comment has successfully posted." }
      format.js
    end
  end

  def accept
    @comment = @article.comments.find(params[:id])
    unless @comment.created_at < 2.days.ago
      @comment.update!(accepted: true)
    end

    redirect_to article_comments_path, notice: "Comment has successfully accepted."
  end

  def deny
    @comment = @article.comments.find(params[:id])
    unless @comment.created_at < 2.days.ago
      @comment.update!(accepted: false)
    end

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

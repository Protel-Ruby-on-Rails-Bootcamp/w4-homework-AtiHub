class CommentsController < ApplicationController
  before_action :set_article
  before_action :authenticate_user!

  def index
    @comments = @article.comments.order('created_at DESC')
  end
  
  def show
    @comment = @article.comments.find(params[:id])
  end
  
  def create
    @comment = @article.comments.create(comment_params)
    @comment.update!(user: current_user)

    @comments = @article.comments.accepted.order('created_at DESC')
    @comments_pending = @article.comments.where(user: current_user).pending.order('created_at DESC')

    respond_to do |format|
      format.html { redirect_to @article, notice: "Comment has successfully posted." }
      format.js
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_comments_path(@article), notice: "Comment has successfully deleted."
  end

  def accept
    @comment = @article.comments.find(params[:id])
    unless @comment.created_at < 2.days.ago
      @comment.accepted!
    end

    redirect_to article_comments_path, notice: "Comment has successfully accepted."
  end

  def deny
    @comment = @article.comments.find(params[:id])
    unless @comment.created_at < 2.days.ago
      @comment.denied!
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

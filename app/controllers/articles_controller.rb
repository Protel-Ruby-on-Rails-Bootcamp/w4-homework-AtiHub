class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy vote ]
  before_action :authenticate_user!

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    redirect_to dashboard_path
  end

  # GET /articles/1 or /articles/1.json
  def show
    @comments = @article.comments.accepted.order('created_at DESC')
    @comments_pending = @article.comments.where(user: current_user).pending.order('created_at DESC')
  end

  # GET /articles/new
  def new
    @article = current_user.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to dashboard_path, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to dashboard_path, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def vote
    type = params[:type]
    if type == 'upvote'; upvote
    elsif type == 'downvote'; downvote; end
    
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :public)
    end

    def upvote
      @article.increment!(:vote_count, 1)
    end
  
    def downvote
      @article.decrement!(:vote_count, 1)
    end
end

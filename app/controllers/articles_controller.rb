class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  access all: [:index], user: [:index, :show], editor: [:index, :show, :new, :edit, :create, :update, :destroy], admin: [:index]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    redirect_to articles_url, notice: 'You are not authorized to edit that article' unless helpers.action_allowed?(current_user, @article)
  end

  # POST /articles
  def create
    @article = Article.new(article_params.merge(user: current_user))

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if helpers.action_allowed?(current_user, @article)
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to articles_url, notice: 'You are not authorized to update that article'
    end
  end

  # DELETE /articles/1
  def destroy
    if helpers.action_allowed?(current_user, @article)
      @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
    else
      redirect_to articles_url, notice: 'You are not authorized to delete that article'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :content, :category, :user_id)
    end
end

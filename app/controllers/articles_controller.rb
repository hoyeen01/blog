class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.order(created_at: :desc)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id]) 
  end

  # POST /articles or /articles.json
  def create
    Article.create({ **params[:article].permit!, user: @user })
    flash[:success] = 'Article was created successfully'
    redirect_to articles_path
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article.update(params[:article].permit!)
    flash[:success] = 'Article was updated successfully'
    redirect_to articles_path
  end

  # DELETE articles/1 or /articles/1.json
  def destroy
    @article.destroy
    flash[:success] = 'Article deleted successfully'
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
end

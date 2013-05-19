class ArticlesController < ApplicationController
  before_filter :signed_in_user

  def index
    @articles = Article.find :all, :order => 'id ASC'
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
   @article = Article.find(params[:id])
  end

  def destroy
    @article.destroy
    redirect_to root_url
  end

  private
   
    def correct_user
      @article = current_user.articles.find_by_id(params[:id])
      redirect_to root_url if @article.nil?
    end
end
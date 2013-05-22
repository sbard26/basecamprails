class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:commenter, :body))
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
end

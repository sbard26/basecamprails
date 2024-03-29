class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @article = current_user.articles.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @afeed_items = current_user.afeed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end

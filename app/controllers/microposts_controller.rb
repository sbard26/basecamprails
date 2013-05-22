class MicropostsController < ApplicationController
  before_filter :signed_in_user

  def index
    @microposts = Micropost.find :all, :order => 'id ASC'
  end

  def new
    @micropost = Micropost.new
  end
  
  def create
   @micropost = current_user.articles.microposts.build(params[:micropost])
   if @micropost.save
     flash[:success] = "Comment posted!"
     redirect_to root_url
   else
     @feed_items= []
     render 'static_pages/home'
   end
  end


  def show
   @micropost = Micropost.find(params[:id])
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_url
  end

  private
    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
 
end
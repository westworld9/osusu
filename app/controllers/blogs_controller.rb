class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy] 
  before_action :login_user, only: [:new, :show, :edit, :destroy]
  def index 
    @blogs=Blog.all.order(id: "DESC")
  end
  def new
    flash.now[:notice] ="新規投稿"
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end 
  def create  
    @blog=Blog.new(blog_params) 
    if @blog.save 
      redirect_to  blogs_path, notice: ""
    else 
      render 'new'
      
    end
  end

  def show 
  end

  def edit
    flash.now[:notice] ="編集"
  end 
  def update  
    if @blog.update(blog_params)
      redirect_to blogs_path
    else 
      render 'edit'
    end
  end 
  def destroy 
     @blog.destroy 
     redirect_to blogs_path
  end 
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  private 
  def blog_params 
    params.require(:blog).permit(:title, :content)
  end 
  def set_blog 
    @blog=Blog.find(params[:id])
  end
  def login_user 
    if current_user.nil?  
      flash[:danger]= "ログインしてください"
      redirect_to new_session_path
    end
  end
end

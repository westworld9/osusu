class UsersController < ApplicationController 
    before_action :login_user, only:[:show]
    def new 
      @user=User.new
    end 
    def create
      @user=User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user.id) 
      else 
        render 'new'
      end
    end  
    def show
      @user=User.find(params[:id])
      @favorite_blogs=@user.favorite_blogs
    end
    private 
    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def login_user 
      if current_user.nil?  
        flash[:danger]= "ログインしてください"
        redirect_to new_session_path
      end
    end
end

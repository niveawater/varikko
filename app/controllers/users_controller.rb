class UsersController < ApplicationController

  before_action :authenticate_user!, expect: [:index]

  def index  #def "action"
    @users = User.all
  
  end

  def show
    @user = User.find(params[:id])  
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: 'アクセスできません。'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)    #update user
      redirect_to user_path(@user), notice: '更新されました。' #bacj to user detail screen 
    else
      render :edit  
    end
  end
  private # can only access in usercontroller = security up
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end

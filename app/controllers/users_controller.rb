class UsersController < ApplicationController
  before_action :require_current_user, except: [:new, :create]
  #before_action :check_user, except: [:new, :create]
  #skip_before_action :require_current_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(params[:id])
    session.clear
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

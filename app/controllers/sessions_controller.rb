class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye"
    redirect_to root_path
  end
end

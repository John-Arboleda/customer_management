class SessionsController < ApplicationController
  # def new
  # end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user
      session[:email] = @user.email
      flash[:success] = 'successfully signed in'
      redirect_to root_path
    else
      flash.now[:danger] = 'Oopps! Something wrong'
      render 'new'
    end
  end

  def destroy
    session[:email] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to sign_in_path
  end
end
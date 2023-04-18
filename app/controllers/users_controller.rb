class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(signup_params)
    if @user.save
      flash[:success] = 'Account is created sucessfully'
      session[:email] = @user.email
      redirect_to root_path
    else
      flash[:danger] = 'Something went wrong'
      render new_user_path
    end
  end

  private

  def signup_params
    params.require(:user).permit(:name, :email, :pass)
  end
end
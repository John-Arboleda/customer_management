class UsersController < ApplicationController

  ##
  # Creates a new instance of the User model.

  def new
    @user = User.new
  end

  ##
  # Creates a new user in the database with the given parameters.
  #
  # If the user is successfully saved, the user is shown a success message,
  # their email is stored in the session, and they are redirected to the root path.
  #
  # If the user is not successfully saved, the user is shown an error message and is
  # redirected back to the new user page.

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

  ##
  # Retrieves the name, email, and password of the user from the parameters.

  def signup_params
    params.require(:user).permit(:name, :email, :pass)
  end
end
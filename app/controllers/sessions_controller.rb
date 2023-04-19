class SessionsController < ApplicationController
  ##
  # Finds the user in the database with the given email address.
  #
  # If the user is found, the user is signed in and redirected to the root path.
  #
  # If the user is not found, the user is shown an error message and is
  # redirected back to the sign in page.

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

  ##
  # Signs the user out by setting the session email to nil.
  #
  # The user is then redirected to the sign in page.

  def destroy
    session[:email] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to sign_in_path
  end
end

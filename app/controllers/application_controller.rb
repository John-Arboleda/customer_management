class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?
  
  ##
  # Retrieves the current user from the session.

  def current_user
    @current_user ||= User.find_by(email: session[:email]) if session[:email]
  end

  ##
  # Checks if the user is logged in.

  def logged_in?
    !current_user.nil?
  end

  ##
  # Requires the user to be logged in before they can access any of the controller's actions.
  #
  # If the user is not logged in, they are shown an error message and redirected to the login page.

  def require_user
    return if logged_in?

    flash[:danger] = 'Log in to perform this action'
    redirect_to new_user_path
  end
end

class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  # Renders sessions/new.html.erb
  # New Log-In Page
  def new
  end

  # Log-In Authentication
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = "Invalid Login Attemp Please Retry"
      redirect_to new_sessions_path
    end
  end

  # Destroying the Session
  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end

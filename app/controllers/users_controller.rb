class UsersController < ApplicationController
  skip_before_action :ensure_logged_in

  # Renders users/new.html.erb
  # New Sign-In Page
  def new
    render "users/new"
  end

  # New User Creation
  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.new(first_name: first_name, email: email, password: password, last_name: last_name)
    new_user.save

    if new_user.save
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(" , ")
      redirect_to new_user_path
    end
  end
end

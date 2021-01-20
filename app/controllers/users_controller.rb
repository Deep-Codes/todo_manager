class UsersController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_beautiful_string }.join("\n")
  end

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

  def login
    email = params[:email]
    password = params[:password]
    login = User.where("email = ? and password = ? ", email, password)
    if login.length > 0
      render plain: true
    else
      render plain: false
    end
  end
end

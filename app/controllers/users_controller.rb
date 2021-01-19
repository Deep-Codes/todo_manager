class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    User.create!(first_name: first_name, email: email, password: password, last_name: last_name)
    redirect_to "/"
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

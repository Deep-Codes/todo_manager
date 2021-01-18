class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_beautiful_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    User.create!(name: name, email: email, password: password)
    render plain: "Created User: #{name}"
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

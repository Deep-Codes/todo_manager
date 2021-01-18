class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "Hello From /Users"
  end
end

class HomeController < ApplicationController
  skip_before_action :ensure_logged_in

  # HOME PAGE
  # Checks for Session and Routes to /todos page
  def index
    if current_user
      redirect_to todos_path
    else
      render "index"
    end
  end
end

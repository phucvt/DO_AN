class AdminController < ApplicationController
  def home
    if current_user.admin?
      render 'home'
    else
      redirect_to root_url
    end
  end
end

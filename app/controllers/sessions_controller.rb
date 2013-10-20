class SessionsController < ApplicationController
  def create
    user = GuestUser.create!
    session[:user_id] = user.id
    flash[:success] = "Singed in as #{user.name}!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Singed out."
    redirect_to root_path
  end
end

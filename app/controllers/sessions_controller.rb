class SessionsController < ApplicationController
  def create
    user = GuestUser.create!
    session[:user_id] = user.id
    flash[:success] = "Signed in as #{user.name}!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Signed out."
    redirect_to root_path
  end
end

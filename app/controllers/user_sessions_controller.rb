class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
    @no_users = User.any? == false
  end

  # Handles log in request
  def create
    User.create(email: params[:user_session][:email], password: params[:user_session][:password]) unless User.any?
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to user_url
    else
      render action: :new
    end
  end

  # Handles log out request
  def destroy
    current_user_session.try(:destroy)
    redirect_to root_url
  end

end
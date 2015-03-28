class UserSessionsController < ApplicationController
  before_action :require_no_user, except: [:destroy]
  before_action :require_user, only: [:destroy]

  def new
    @user_session = UserSession.new
    @users_exist = User.any?
  end

  # Handles log in request
  def create
    User.create(email: params[:user_session][:email], password: params[:user_session][:password], admin: true) unless User.any?
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

  private

  def require_no_user
    redirect_to user_path if current_user
  end

end
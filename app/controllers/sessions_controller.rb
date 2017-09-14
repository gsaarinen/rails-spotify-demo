class SessionsController < ApplicationController
  require 'RSpotify'

  # old way, changed the routes
  def create
    # New method
    #@user = User.new.create_from_omniauth(auth)
    @user = RSpotify::User.new(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
    flash[:success] = "Successfully logged in!"
    # byebug
  end

  def destroy
    session[:user_id]  = nil
    session[:omniauth] = nil
    redirect_to root_url, :notice => "SIGNED OUT"
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end

class SessionsController < ApplicationController
  require 'RSpotify'

  # # old way, changed the routes
  # def create
  #   # Gets Spotify auth info and stores in variable
  #   #vrspotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  #
  #   # New way -- creates user in db
  #   # @user = User.find_or_create_from_auth_hash(auth)
  #   @user = User.create_from_omniauth(auth)
  #   # byebug
  #   # session[:rspotify_user] = rspotify_user
  #
  #   # Temp used to look at auth hash
  #   # raise env["omniauth.auth"].to_yaml
  #
  #   # These work - put them back in after testing.
  #   # redirect_to @user
  #   flash[:success] = "Successfully logged in as #{@user.name} (User ID = #{@user.id})!"
  #   redirect_to @user
  #   # render 'users/show'
  #
  #
  #   # byebug
  # end

  def create
    # render text: request.env['omniauth.auth'].to_json

    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    if current_user
      session.delete(:user_id)
      # session[:user_id]  = nil
      # session[:omniauth] = nil
      flash[:success] = 'See you later!'
    end
    redirect_to root_url
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end

class UsersController < ApplicationController

  def spotify
    raise env["omniauth.auth"].to_yaml
    # @user = RSpotify::User.new(request.env['omniauth.auth'])
    # redirect_to root_url #flash[:success] = "Authorized with Spotify"

    # This give's an (invalid_grant: Invalid authorization code) error
    # redirect_to @user
  end

  def show
    @user = User.find_by(params[:uid])
  end

  def new
    @user = User.new
  end


end

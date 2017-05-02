class UsersController < ApplicationController

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    redirect_to root_url

    # This give's a (invalid_grant: Invalid authorization code) error
    # redirect_to spotify_user
  end
end

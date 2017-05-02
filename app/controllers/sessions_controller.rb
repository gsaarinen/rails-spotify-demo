class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    session[:omniauth] = auth.except('extra')
    user = Rspotify::User.new(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, notice: "SIGNED IN"
  end

  def destroy
    session[:user_id]  = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "SIGNED OUT"
  end
end

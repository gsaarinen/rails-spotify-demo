require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "d933f2ea71cc4e39ba636d0419ac338a", "0fcf19f3be334bea9c90cca0249b96e8", scope: 'user-read-email playlist-modify-public playlist-modify-public user-library-read user-library-modify'
end

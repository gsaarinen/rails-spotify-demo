class User < ApplicationRecord

###

#  def self.sign_in_from_omniauth(auth)
#    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
#  end
#
#  def self.create_user_from_omniauth(auth)
#    create(
#      provider: auth['provider'],
#      uid:      auth['uid'],
#      name:     auth['info']['name']
#    )
#  end

# Old method -- 1.12.18
  # def self.from_omniauth(auth)
  #   where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  # end

# New method
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['display_name']
      user.image_url = auth_hash['info']['images'][0]['url']
      user.url = auth_hash['info']['external_urls']['spotify']
      user.access_token = auth_hash['credentials']['token']
      user.secret = auth_hash['credentials']['secret']
      user.save!
      user
    end
  end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth.info.display_name
  #     user.access_token = auth.credentials.token
  #     # byebug
  #   end
  # end

  # Will try this but not implemented anywhere yet
  #
  # def self.find_or_create_from_auth_hash(auth)
  #   user = where(provider: auth.provider, uid: auth.uid, name: auth.display_name, access_token: auth.access_token).first_or_create
  #   user.update(
  #     name: auth.display_name,
  #     access_token: auth.access_token,
  #     uid: auth.uid
  #   )
  #   user
  # end

end

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

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_user_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["display_name"]
      user.access_token = auth["access_token"]
    end
  end

  # Will try this but not implemented anywhere yet

  def self.find_or_create_from_auth_hash(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.update(
      name: auth.display_name,
      access_token: auth.access_token,
      uid: auth.uid
    )
    user
  end

end

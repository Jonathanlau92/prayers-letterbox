class Identity < ApplicationRecord
  belongs_to :user

  # def self.find_with_omniauth(auth)
  #   find_by(uid: auth['uid'], provider: auth['provider'])
  # end

  # def self.create_with_omniauth(auth)
  #   create(uid: auth['uid'], provider: auth['provider'])
  # end

  def self.find_oauth(auth)

    user = Identity.where(:provider => auth.provider, :uid => auth.uid).first
    unless user.nil?
        user.user
    else
        registered_user = User.where(:email => auth.info.email).first
        unless registered_user.nil?
          Identity.create!(
                          provider: auth.provider,
                          uid: auth.uid,
                          user_id: registered_user.id
                          )
            registered_user
        else
            user = User.create!(
                name: auth.info.name,
                        email: auth.info.email,
                        password: Devise.friendly_token[0,20],
                        )
            user_provider = Identity.create!(
                provider:auth.provider,
                        uid:auth.uid,
                          user_id: user.id
                )
            user
        end
    end
end
end

class User < ApplicationRecord
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :timeoutable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
  def self.create_with_omniauth(info)
    create(name: info['name'])
  end
  has_one_attached :profile_image

  has_many :prayers
  has_many :comments
  has_many :identities, :dependent => :destroy

  validates :name, presence: true
  validates :email, presence: true
end

class User < ApplicationRecord
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_one_attached :profile_image
  after_create :assign_default_role

  # Friendship links to user
  has_friendship

  # acts_as_target configures your model as ActivityNotification::Target
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # This is an example without any options (default configuration) as the target.
  acts_as_target

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
  has_many :prayers
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true
end

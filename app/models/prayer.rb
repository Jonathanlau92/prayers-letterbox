class Prayer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :request, presence: true
end

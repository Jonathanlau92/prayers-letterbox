class Prayer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :category

  validates :request, presence: true
end

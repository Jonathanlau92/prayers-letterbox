class Prayer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :categories
  accepts_nested_attributes_for :categories

  validates :request, presence: true
end

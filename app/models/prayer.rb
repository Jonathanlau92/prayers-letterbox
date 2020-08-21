class Prayer < ApplicationRecord
  enum status: { Active: 0, Archived: 1, Completed: 2 }
  belongs_to :user, optional: true
  has_many :comments
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories

  validates :request, presence: true
end

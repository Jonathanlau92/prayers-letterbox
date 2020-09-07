class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :prayer

    validates :content, presence: true
end
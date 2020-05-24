class Prayer < ApplicationRecord
  belongs_to :user, optional: true
end

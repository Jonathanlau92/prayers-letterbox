class Category < ApplicationRecord
  belongs_to :prayer, optional: true
end

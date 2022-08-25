class Payment < ApplicationRecord
  belongs_to :sale
  has_many :user
end

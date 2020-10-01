class Purchaser < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :order
end

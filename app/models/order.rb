class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :item
  belongs_to :purchaser

  with_options presence: true do
    validates :post_code, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :address, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :building_name, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :phone_number, format: {with: /\A[a-z\d]{8,100}+\z/i}
  end
end

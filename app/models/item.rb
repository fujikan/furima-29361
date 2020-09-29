class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time
  has_one :purchaser
  
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
  validates :name, :description, :image, :price
  validates :name,  length: { maximum: 40 } 
  validates :description, length: { maximum: 1000 } 
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 300, less_than: 9999999}
  end
end

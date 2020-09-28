class LoseItem

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :address, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :building_name, format: {with: /\A[a-z\d]{8,100}+\z/i}
    validates :phone_number, format: {with: /\A[a-z\d]{8,100}+\z/i}
  end
    def save
      purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
      Order.create!(post_code: post_code, prefecture_id: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id)
    end
end

 
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :family_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角で入力してください。"}
    validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角で入力してください。"}
    validates :birth_day
  end
  has_many :items
end

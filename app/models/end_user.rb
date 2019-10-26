class EndUser < ApplicationRecord
  # validates :given_name_kanji, presence: true, length: { maximum: 10 }
  # validates :family_name_kanji, presence: true, length: { maximum: 10 }
  # validates :family_name_kana, presence: true, length: { maximum: 10 }
  # validates :given_name_kana, presence: true, length: { maximum: 10 }
  # validates :family_name_kanji, presence: true, length: { maximum: 10 }
  # # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #メール用の正規表現
  # validates :email, presence: true, uniqueness: true
  # # , format: { with: VALID_EMAIL_REGEX }
  # validates :address, presence: true, length: { maximum: 100 }
  # validates :post_code, presence: true, length: { maximum: 8 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid # 論理削除
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :addresses
  has_many :cart_items
end

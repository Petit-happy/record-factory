class EndUser < ApplicationRecord
  validates :given_name_kanji, presence: true, length: { maximum: 10 }
  validates :family_name_kanji, presence: true, length: { maximum: 10 }
  validates :family_name_kana, presence: true, length: { maximum: 10 }
  validates :given_name_kana, presence: true, length: { maximum: 10 }
  validates :family_name_kanji, presence: true
  validates :email, presence: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :post_code, presence: true, length: { maximum: 8 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid # 追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end

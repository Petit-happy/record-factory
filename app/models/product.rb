class Product < ApplicationRecord

  def self.search(search)
      return Product.all unless search
      Product.where(['content LIKE ?', "%#{search}%"])
    end

    belongs_to :genre
    belongs_to :label
    belongs_to :artist
    has_many :arrivals, dependent: :destroy
    has_many :discs, dependent: :destroy
    has_many :cart_item, dependent: :destroy
    enum sales_status: { sold: 0, selling: 1, stop: 2} # enumを使ってステータス表示を可能にした

    attachment :photo
end

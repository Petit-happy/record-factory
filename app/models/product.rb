class Product < ApplicationRecord

  def self.search(search)
    if search
      where(['product_name LIKE ?', "%#{search}%"])
    else
      all
    end
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

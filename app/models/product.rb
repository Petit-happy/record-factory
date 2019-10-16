class Product < ApplicationRecord

  def self.search(search)
      return Product.all unless search
      Product.where(['content LIKE ?', "%#{search}%"])
    end

    belongs_to :genre
    belongs_to :label
    belongs_to :artist
end

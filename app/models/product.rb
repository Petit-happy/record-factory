class Product < ApplicationRecord

  def self.search(search)
      return Product.all unless search
      Product.where(['content LIKE ?', "%#{search}%"])
    end

end

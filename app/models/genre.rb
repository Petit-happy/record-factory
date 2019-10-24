class Genre < ApplicationRecord
    validates :genre_name, presence: true, length: { maximum: 50 }
    has_many :products
end

class Label < ApplicationRecord
    validates :label_name, presence: true, length: { maximum: 50 }
    has_many :products
end

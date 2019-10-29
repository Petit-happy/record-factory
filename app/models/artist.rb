class Artist < ApplicationRecord
    validates :artist_name, presence: true, length: { maximum: 500 }
    has_many :products, dependent: :destroy
end

class Artist < ApplicationRecord
    validates :artist_name, presence: true, length: { maximum: 50 }
    has_many :products, dependent: :destroy
end

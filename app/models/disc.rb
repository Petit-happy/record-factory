class Disc < ApplicationRecord
    validates :disc_no, presence: true
    has_many :songs, dependent: :destroy
end

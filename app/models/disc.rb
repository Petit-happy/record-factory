class Disc < ApplicationRecord
    validates :disc_no, presence: true
    has_many :songs, dependent: :destroy
    belongs_to :product
    accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end

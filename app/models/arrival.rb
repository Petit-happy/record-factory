class Arrival < ApplicationRecord
    validates :arrival_sum, presence: true
    validates :arrived_at, presence: true
    belongs_to :product
end

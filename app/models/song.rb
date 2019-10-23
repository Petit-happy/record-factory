class Song < ApplicationRecord
    validates :email, presence: true
    belongs_to :disc
end

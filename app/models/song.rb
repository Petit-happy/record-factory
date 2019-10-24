class Song < ApplicationRecord
    validates :song_no, presence: true
    validates :song_name, presence: true, length: { maximum: 50 }
    belongs_to :disc
end

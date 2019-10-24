class Address < ApplicationRecord
    validates :delivery_name, presence: true, length: { maximum: 50 }
    validates :delivery_address, presence: true, length: { maximum: 200 }
    validates :delivery_post_code, presence: true, length: { maximum: 8 }
    belongs_to :end_user
end

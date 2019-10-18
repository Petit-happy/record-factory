class Order < ApplicationRecord


    has_many :order_details, dependent: :destroy
    belongs_to :end_user
    enum order_status: { accept: 0, prepare: 1, delivery: 2} #enumを使ってステータス表示を可能にした

end

class Order < ApplicationRecord
      enum order_status: { accept: 0, prepare: 1, delivery: 2} #enumを使ってステータス表示を可能にした
    has_many :order_detail, dependent: :destroy
end

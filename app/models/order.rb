class Order < ApplicationRecord


    has_many :order_details, dependent: :destroy
    belongs_to :end_user
    enum order_status: { accept: 0, prepare: 1, delivery: 2} #enumを使ってステータス表示を可能にした

      #Order.Detail.unit_price

    # 小計
    def total_unit_price
      total_unit_price = 0
      order_details.each do |detail|
        total_unit_price += detail.unit_price
      end
     total_unit_price
    end
    # 総額
    def total_price
      total_price = total_unit_price + delivery_cost
      total_price
    end
    #合計点数
    def order_total_unit
        u = 0
      order_details.each do |detail|
        u += detail.unit
      end
        u
    end
end

class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :product

# #小計
# def sum_price(d_price)
#    price + d_price
# end


#price　= sum_price(d_price)

def  unit_price
    (unit * price * 1.1).round
end

# Order.Detail.unit_price

end

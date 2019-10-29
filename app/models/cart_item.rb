class CartItem < ApplicationRecord
    belongs_to :end_user
    belongs_to :product
    #　カート内の点数合計
    # userは引数
    def cart_total_unit
        x = 0
        current_end_user.cart_items.each do |cart_item|
            x += cart_item.cart_sum
        end
        x
    end
# ==cartの中の商品の点数の合計を求める==
# *yの中身は配列を入れる(@cart_items)
    def self.total_cart_sum(*y)
        x = 0
        # 配列を並べる
        y.each do |f|
            #抽出した配列からsumを計算する
            f.each do |g|
                x += g.cart_sum
            end
        end
        x
    end
# ==cartの中の商品の合計値を求める==
# *yの中身は配列を入れる(@cart_items)
    def self.total_cart_price(*y)
        x=0
        # 配列を並べる
        y.each do |f|
            #抽出した配列からproduct_priceを計算する
            f.each do |g|
                p = Product.find(g.product_id)
                x += p.product_price * g.cart_sum
            end
        end
       x
    end

end

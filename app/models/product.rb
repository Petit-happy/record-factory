class Product < ApplicationRecord
  belongs_to :genre
  belongs_to :label
  belongs_to :artist
  has_many :arrivals, dependent: :destroy
  has_many :discs, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  enum sales_status: { sold: 0, selling: 1, stop: 2} # enumを使ってステータス表示を可能にした
  attachment :photo
  def self.search(search)
    if search
      where(['product_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def total_arrival_unit_a
    total_arrival_unit = 0
    arrivals.each do |arrival|
      total_arrival_unit += arrival.arrival_sum
    end
    total_arrival_unit
  end

  def total_order_detail_unit_a
    total_order_detail_unit = 0
    order_details.each do |detail|
      total_order_detail_unit += detail.unit
    end
    total_order_detail_unit
  end

  def stock
    stock = total_arrival_unit_a - total_order_detail_unit_a
  end
end

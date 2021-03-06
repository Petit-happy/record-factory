class Product < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  validates :product_price, presence: true
  validates :sales_status, presence: true
  belongs_to :genre
  belongs_to :label
  belongs_to :artist
  has_many :arrivals
  has_many :discs
  has_many :cart_items
  has_many :order_details
  enum sales_status: { sold: 0, selling: 1, stop: 2} # enumを使ってステータス表示を可能にした
  attachment :photo
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
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


  def stock_array
    stock_a = []
    x = 0
    # quantityは0スタート配列に入れてゆく
    # timesは数え上げてくれる（0~)
    # stock_a.push(stock)
    stock.times do |quantity|
      stock_a.push(quantity + 1)
    end
    stock_a
  end
end

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: destroy
  validates :customer_id, :address, :name, :shipping_cost,
    :total_payment, :payment_method,
    presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :shipping_cost, :total_payment, numericality: { only_integer: true }
end

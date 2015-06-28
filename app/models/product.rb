class Product < ActiveRecord::Base
  belongs_to :product_type
  has_many :product_details
  has_many :services
  has_many :steps
  has_many :orders
  has_many :coupons
end

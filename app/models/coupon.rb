class Coupon < ActiveRecord::Base
  enum status: [:unused, :used, :paid, :finished]
  belongs_to :customer
  belongs_to :product
  belongs_to :order
end

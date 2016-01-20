class PayRecord < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  belongs_to :shop
end

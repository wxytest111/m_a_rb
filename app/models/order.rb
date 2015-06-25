class Order < ActiveRecord::Base
  belongs_to :street
  belongs_to :customer
  belongs_to :worker
  belongs_to :product
end

class Order < ActiveRecord::Base
  enum status: [:start, :choose, :unpaid, :time_out, :paid, :leaving, :service, :finish]

  belongs_to :street
  belongs_to :customer
  belongs_to :worker
  belongs_to :product
  has_one :comment
end

class Worker < ActiveRecord::Base
  has_one :token

  has_many :grabs
  has_many :orders
  has_many :appointments, through: :grabs
end

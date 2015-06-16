class Worker < ActiveRecord::Base
  has_one :token

  has_many :grabs
  has_many :appointments, through: :grabs
end

class Worker < ActiveRecord::Base
  has_one :token

  has_many :appointments, through: :grabs
end

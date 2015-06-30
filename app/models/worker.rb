class Worker < ActiveRecord::Base
  has_one :token

  has_many :grabs
  has_many :orders
  has_many :worker_streets
  has_many :streets, through: :worker_streets
  has_many :appointments, through: :grabs


  def has_street street
    self.streets.include? street
  end
end

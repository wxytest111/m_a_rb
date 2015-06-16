class Appointment < ActiveRecord::Base
  enum status: [:start, :waiting, :ready, :begin, :finished]

  belongs_to :product
  belongs_to :service
  belongs_to :customer

  has_many :workers, through: :grabs
end

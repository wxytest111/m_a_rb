class Street < ActiveRecord::Base
  belongs_to :area
  has_many :orders
  has_many :worker_streets
  has_many :workers, through: :worker_streets
end

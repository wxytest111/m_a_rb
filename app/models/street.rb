class Street < ActiveRecord::Base
  belongs_to :area
  has_many :orders
  has_many :workers, through: :worker_streets
end

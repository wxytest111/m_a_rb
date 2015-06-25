class Street < ActiveRecord::Base
  belongs_to :area
  has_many :orders
end

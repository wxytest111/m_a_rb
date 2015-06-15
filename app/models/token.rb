class Token < ActiveRecord::Base
  belongs_to :customer
  belongs_to :worker
end

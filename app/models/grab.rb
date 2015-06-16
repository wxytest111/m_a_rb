class Grab < ActiveRecord::Base
  belongs_to :worker
  belongs_to :appointment
end

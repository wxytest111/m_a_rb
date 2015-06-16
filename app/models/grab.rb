class Grab < ActiveRecord::Base
  enum status: [:start, :waiting, :ready, :begin, :finished, :abort, :other_worker]

  belongs_to :worker
  belongs_to :appointment
end

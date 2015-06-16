class Grab < ActiveRecord::Base
  enum status: [:start, :waiting, :ready, :begin, :finished, :cancel, :abort, :other_worker, :time_out]

  belongs_to :worker
  belongs_to :appointment
end

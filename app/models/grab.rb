class Grab < ActiveRecord::Base
  enum status: [:start, :waiting, :ready, :begin, :finished, :cancel, :other_worker, :time_out]

  belongs_to :worker
  belongs_to :appointment
end

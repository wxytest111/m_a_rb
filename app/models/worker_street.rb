class WorkerStreet < ActiveRecord::Base
  belongs_to :worker
  belongs_to :street
end

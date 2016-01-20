class Subscribe < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  belongs_to :pay_record
  belongs_to :district
  belongs_to :waitress
end

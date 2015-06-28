class Customer < ActiveRecord::Base
  enum gender: [:female, :male]

  validates :mobile, uniqueness: { message: '该手机已经被注册,请您直接登录' }

  has_one :token
  has_many :appointments
  has_many :orders
  has_many :coupons
end

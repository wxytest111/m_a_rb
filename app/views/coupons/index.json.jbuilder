json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :customer_id, :price, :end_time, :product_id, :status, :order_id, :description
  json.url coupon_url(coupon, format: :json)
end

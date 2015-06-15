require 'digest/sha1'

class RegisterController < ApplicationController
  before_filter :set_headers

  def get_check_code
    mobile = params[:mobile]
    user_type = params[:user_type]
    code = new_code
    check_code= CheckCode.where(mobile:mobile)
    now = Time.now
    if check_code.size>0 && (Time.now - check_code[0].updated_at)<60
      render json: {result:0, errorcode:2, errormsg: '请一分钟后重试'}
    else
      check_code = CheckCode.find_or_create_by!(mobile:mobile)
      check_code.code = code
      check_code.save!
      render json: {result:1}
    end
  end

  def register
    mobile = params[:mobile]
    user_type = params[:user_type]
    check_code = params[:check_code]
    password = params[:password]
    check_codes= CheckCode.where(mobile:mobile)
    require 'byebug';byebug
    if check_codes.size>0
      if (Time.now - check_codes[0].updated_at)>30*60
        @result = 0
        @error_code = 2
        @error_msg = '验证码失效，请重新获取.'
      elsif check_codes[0].code!=check_code
        @result = 0
        @error_code = 2
        @error_msg = '验证码有误，请重新输入.'
      else
        if user_type == 1
          customer = Customer.where(mobile:mobile)
          if(customer.size>0)
            @result = 0
            @error_code = 3
            @error_msg = '该手机已经被注册，请您直接登录.'
          else
            customer = Customer.new(mobile:mobile, password:password, nick_name:mobile)
            token = Token.new(token:Digest::SHA1.hexdigest(Time.now.to_s))
            customer.token = token
            customer.save!
            @result = 1
            @token = token.token
            @data = {user_type:user_type,customer_id:customer.id,mobile:mobile,nick_name:customer.nick_name,address:customer.address,status:0}
          end
        end
      end
    end
  end

  private
  def new_code
    "#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}"
  end
end
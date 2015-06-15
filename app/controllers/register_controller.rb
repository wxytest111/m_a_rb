require 'digest/sha1'

class RegisterController < ApplicationController
  before_filter :set_headers

  def get_check_code
    mobile = params[:mobile]
    user_type = params[:user_type]
    code = new_code
    check_code= CheckCode.find_by_mobile(mobile)
    now = Time.now
    if check_code  && (Time.now - check_code.updated_at)<60
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
    user_type = params[:user_type].to_i
    check_code = params[:check_code]
    password = params[:password]
    check_codes= CheckCode.find_by_mobile(mobile)
    if check_codes
      if (Time.now - check_codes.updated_at)>30*60
        @result = 0
        @error_code = 2
        @error_msg = '验证码失效，请重新获取.'
      elsif check_codes.code!=check_code
        @result = 0
        @error_code = 2
        @error_msg = '验证码有误，请重新输入.'
      else
        if user_type == 1
          customer = Customer.find_by_mobile(mobile)
          if customer
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
        elsif user_type == 2
          worker = Worker.find_by_mobile(mobile)
          if worker
            @result = 0
            @error_code = 3
            @error_msg = '该手机已经被注册，请您直接登录.'
          else
            worker = Worker.new(mobile:mobile, password:password)
            token = Token.new(token:Digest::SHA1.hexdigest(Time.now.to_s))
            worker.token = token
            worker.save!
            @result = 1
            @token = token.token
            @data = {user_type:user_type,worker_id:worker.id,mobile:mobile,name:worker.name,address:worker.address,status:0}
          end
        else
          @result = 0
          @error_code = 10002
          @error_msg = '用户类型错误.'
        end
      end
    end
  end

  def log_out
    mobile = params[:mobile]
    user_type = params[:user_type].to_i
    token = params[:token]
    if user_type ==1
      customer = Customer.find_by_mobile(mobile)
      if customer
        if customer.token
          if customer.token.token == token
            customer.token = nil
            customer.save!
            @result = 1
          else
            @result = 0
            @error_code = 10002
            @error_msg = '您无权操作该用.'
          end
        else
          @result = 0
          @error_code = 10000
          @error_msg = '用户未登录，请直接登录.'
        end
      else
        @result = 0
        @error_code = 10003
        @error_msg = '用户不存在.'
      end
    elsif user_type == 2
      worker = Worker.find_by_mobile(mobile)
      if worker
        if worker.token
          if worker.token.token == token
            worker.token = nil
            worker.save!
            @result = 1
          else
            @result = 0
            @error_code = 10002
            @error_msg = '您无权操作该用.'
          end
        else
          @result = 0
          @error_code = 10000
          @error_msg = '用户未登录，请直接登录.'
        end
      else
        @result = 0
        @error_code = 10003
        @error_msg = '用户不存在.'
      end
    else
      @result = 0
      @error_code = 10002
      @error_msg = '用户类型错误.'
    end
  end

  def log_in
    mobile = params[:mobile]
    user_type = params[:user_type].to_i
    password = params[:password]
    if user_type == 1
      customers = Customer.where(mobile:mobile,password:password)
      if customers.size > 0
        customer = customers[0]
        token = Token.new(token:Digest::SHA1.hexdigest(Time.now.to_s))
        customer.token = token
        customer.save!
        @token = token.token
        @result = 1
        @data = {user_type:user_type,customer_id:customer.id,mobile:mobile,nick_name:customer.nick_name,address:customer.address,status:0}
      else
        @result = 0
        @error_code = 10004
        @error_msg = '用户名或密码错误.'
      end
    elsif user_type == 2
      workers = Worker.where(mobile:mobile,password:password)
      if workers.size > 0
        worker = workers[0]
        token = Token.new(token:Digest::SHA1.hexdigest(Time.now.to_s))
        worker.token = token
        worker.save!
        @result = 1
        @token = token.token
        @data = {user_type:user_type,worker_id:worker.id,mobile:mobile,name:worker.name,address:worker.address,status:0}
      else
        @result = 0
        @error_code = 10004
        @error_msg = '用户名或密码错误.'
      end
    else
      @result = 0
      @error_code = 10002
      @error_msg = '用户类型错误.'
    end
  end

  private
  def new_code
    "#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}"
  end
end
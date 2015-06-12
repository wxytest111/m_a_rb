class SmsController < ApplicationController
  def get_code
    mobile = params[:mobile]

    code = "#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}"

    render json: {ret:'success', code:code}
  end
end
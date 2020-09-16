class Api::Auth::AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])

    if !user
      render json: { msg: 'Username doesn\'t exists' }, status: :unprocessable_entity
      return true
    end

    if user.authenticate(params[:password])
      render json: { msg: 'Success login', user: user }, status: :ok
    else
      render json: { msg: 'Password wrong' }, status: :unprocessable_entity
    end
   
    
  end
end

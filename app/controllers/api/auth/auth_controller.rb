class Api::Auth::AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])

    if !user
      render json: { msg: 'Username doesn\'t exists' }, status: :unprocessable_entity
      return true
    end

    if user.authenticate(params[:password])
      token = self.create_token(user.id, user.username, user.type.to_s)
      user.set(:token => token)
      render json: { msg: 'Success login', user: user.as_json({ :except => [:password_digest]}) }, status: :ok
    else
      render json: { msg: 'Password wrong' }, status: :unprocessable_entity
    end
   
    
  end
end

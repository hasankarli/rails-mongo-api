class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:update_user, :delete_user, :show_user]
  before_action  only: [:update_user, :delete_user] do
    check_token
  end

 

  def get_users
    users = User.all
    if users
      render json: users, status: :ok
    else
      render json: {msg: "Users not found"}, status: :unprocessable_entity
    end

  end

  def add_user
    user = User.new(userparams)
    user.type = 2
    if user.save()
      render json: user, status: :ok
    
    else 
      render json: {msg: "User not added", error: user.errors}, status: :unprocessable_entity
    end

  end

  def show_user
    if @user
        render json: @user,status: :ok      
    else
      render json: { msg: "User not found" }, status: :unprocessable_entity
    end
  end
  

  def update_user
    if @user
      if @user.update(userparams)
        render json: @user,status: :ok
      else
        render json: { msg: "User not updated", error: @user.errors }, status: :unprocessable_entity
      end
      
    else
      render json: { msg: "User not found" }, status: :unprocessable_entity
    end
  end

  def delete_user
    if @user
      if @user.destroy()
        render json: @user,status: :ok
      else
        render json: { msg: "User not deleted" }, status: :unprocessable_entity
      end
      
    else
      render json: { msg: "User not found" }, status: :unprocessable_entity
    end
  end
  
  

  private
    def userparams
      params.permit(:username, :email, :password)
    end
    
    def get_user
      @user = User.find(params[:id])
    end
    

end

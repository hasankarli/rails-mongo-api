class Api::V1::UsersController < ApplicationController
  before_action :getUser, only: [:updateUser, :deleteUser, :showUser]

  def getUsers
    users = User.all
    if users
      render json: users, status: :ok
    else
      render json: {msg: "Users not found"}, status: :unprocessable_entity
    end

  end

  def addUser
    user = User.new(userparams)
    
    if user.save()
      render json: user, status: :ok
    
    else 
      render json: {msg: "User not added"}, status: :unprocessable_entity
    end

  end

  def showUser
    if @user
        render json: @user,status: :ok      
    else
      render json: { msg: "User not found" }, status: :unprocessable_entity
    end
  end
  

  def updateUser
    if @user
      if @user.update(userparams)
        render json: @user,status: :ok
      else
        render json: { msg: "User not updated" }, status: :unprocessable_entity
      end
      
    else
      render json: { msg: "User not found" }, status: :unprocessable_entity
    end
  end

  def deleteUser
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
      params.permit(:username, :email, :password_digest)
    end
    
    def getUser
      @user = User.find(params[:id])
    end
    

end

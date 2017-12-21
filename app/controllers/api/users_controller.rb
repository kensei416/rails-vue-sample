class Api::UsersController < ApplicationController

  def index 
    @users = User.order('updated_at DESC')
  end


  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      render json: { email: @user.email, user_id: @user.user_id }
    else
      render json: @user, status: :unprocessable_entity
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :user_id, :password, :password_confirmation)
  end
end

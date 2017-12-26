class Api::UsersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destory, :update]

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
      log_in @user
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

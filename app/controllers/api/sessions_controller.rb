class Api::SessionsController < ApplicationController
  def create
  
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password]) && !logged_in?
      log_in user
      render json: { email: user.email, password: user.password, user_id: user.user_id, categories: user.categories.all }
    else
      render json: { ErrorMesage: 'Invalid email/password combination' }, status: :not_found
    end
  end

  def destroy
    if log_out
      render :show, status: :destroy
    else
      render json: { ErrorMessage: 'Invalid logout' }
    end
  end
  
end

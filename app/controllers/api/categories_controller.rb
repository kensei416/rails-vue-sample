class Api::CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  def create
    user = User.find_by(id: params[:user_id])
    @category = user.categories.build(title: params[:title], id: params[:id], user_id: params[:user_id])
    if @category.save
      render :show, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end
end

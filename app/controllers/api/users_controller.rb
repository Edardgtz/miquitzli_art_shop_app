class Api::UsersController < ApplicationController
  before_action :athenticate_user, only: [:create, :update, :destroy]
  
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User Successfully Created!"}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end

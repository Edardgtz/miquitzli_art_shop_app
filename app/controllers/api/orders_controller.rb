class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  
end

class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.materials = params[:materials] || @product.materials
    @product.price = params[:price] || @product.price
    @product.sale_status = params[:sale_status] || @product.sale_status

    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(
      name: params[:name],
      materials: params[:materials],
      price: params[:price],
      sale_status: params[:sale_status]
    )

    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Item Successfully Destroyed!"}
  end
end

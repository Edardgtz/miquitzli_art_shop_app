class Api::ProductsController < ApplicationController

  def index
    search_term = params[:search]
    if search_term
      @products = Product.where("name ILIKE ?","%#{search_term}%")
    else
      @products = Product.all
    end

    category = params[:category]
    if category
      @products = Product.where(category: params[:category].capitalize)
    else
      @products = Product.all
    end

    
    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    else
      @products = @products.order(id: :asc)
    end
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

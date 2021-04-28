class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products
      render "index.json.jb"
    else
      p current_user
      render json: {message: "Something went wrong"}
    end
  end
  
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: "carted",
    )
    @carted_product.save
    p current_user.id
    render 'show.json.jb'
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    render json: {message: "This item has been successfully removed!"}
  end
end

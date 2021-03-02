class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jb"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.image_url = params[:image_url] || @image.image_url
    @image.product_id = params[:product_id] || @image.product_id

    if @image.save
      render 'show.json.jb'
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def create
    @image = Image.new(
      image_url: params[:image_url],
      product_id: params[:product_id]
    )

    if @image.save
      render 'show.json.jb'
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: {message: "Image Successfully Destroyed!"}
  end 
end

class Product < ApplicationRecord
  validates :name, :price, :category, :materials, :sale_status, presence: true
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  
  def tax
    @tax = price * 0.09
  end

  def total
    @total = price + tax
  end
end

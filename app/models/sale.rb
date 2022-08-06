class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_products
  has_many :products, :through => :sale_product

  enum status: %i[pending completed]

  def sale_products_total
    sale_products.sum(:total_price)
  end
end

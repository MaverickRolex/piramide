class Product < ApplicationRecord
  has_many :sale_products
  has_many :sales, :through => :sale_product
end

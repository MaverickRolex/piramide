class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_products
  has_many :products, :through => :sale_product

  enum status: %i[pending autorized completed]

  def sale_products_total
    sale_products.sum(:total_price)
  end

  def sale_status
    case self.status
    when "pending"
      "Pendiente"
    when "autorized"
      "Autorizado"
    when "completed"
      "Completado"
    else
      "Sin Asignar"
    end
  end
end

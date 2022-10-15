class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_products
  has_many :products, :through => :sale_product
  has_many :payments

  enum status: %i[pending budget completed]

  def sale_status
    case self.status
    when "pending"
      "Pendiente"
    when "budget"
      "Presupuesto"
    when "completed"
      "Completado"
    else
      "Sin Asignar"
    end
  end
  
  def sale_products_total
    sale_products.sum(:total_price)
  end
  
  def sale_payments_total(current_user)
    payments.where(user_id: current_user).sum(:amount)
  end

end

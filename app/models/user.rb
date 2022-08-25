class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales
  has_many :payments

  def pending_sales
    sales.pending
  end

  def autorized_sales
    sales.autorized
  end

  def completed_sales
    sales.completed
  end
end

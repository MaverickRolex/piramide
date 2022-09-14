class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales
  has_many :payments
  
  belongs_to :parent, foreign_key: :parent_id, class_name: "User", optional: true
  has_many :children, foreign_key: :parent_id, class_name: "User"
  
  def no_parent_message
    "No hay padrino seleccionado."
  end

  def no_children_message
    "El usuario no cuenta con colaboradores."
  end

  def calc_level(current_user)
    level - current_user.level + 1
  end

  def filter_children
    (print_children.map do |user|
      if user.children.length < 3
        user
      end
    end).compact!
  end

  def print_children
    (children.map do |user|
      user.children + user.print_children
    end.flatten + children).uniq
  end

  def level_and_full_name(current_user)
    "Nivel: " + calc_level(current_user).to_s + " - " + full_name
  end

  def full_name
    first_name + " " + last_name
  end

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

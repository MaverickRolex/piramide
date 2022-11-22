class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sales
  has_many :payments

  belongs_to :registrer, foreign_key: :registrer_id, class_name: "User", optional: true
  has_many :records, foreign_key: :registrer_id, class_name: "User"
 
  belongs_to :parent, foreign_key: :parent_id, class_name: "User", optional: true
  has_many :children, foreign_key: :parent_id, class_name: "User"
  
  def no_parent_message
    "No hay padrino seleccionado."
  end

  def no_children_message
    "El usuario no cuenta con colaboradores."
  end

  def calc_level(current_user)
    if level.present?
      level - current_user.level + 1
    else
      " - Sin Asignar -"
    end
  end

  def print_children
    (children.map do |user|
      user.children + user.print_children
    end.flatten + children).uniq
  end

  def filter_children
    (print_children.map do |user|
      if user.children.length < 3
        user
      end
    end).compact!
  end

  def count_collaborators(index, current_user)
    children = print_children
    children.count {|child| child.calc_level(current_user) === index + 1}
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

  def weekly_sales
    sales.where(created_at: DateTime.now.at_beginning_of_week..DateTime.now.at_end_of_week).completed
  end

  def weekly_sale_total
    sales.where(created_at: DateTime.now.at_beginning_of_week..DateTime.now.at_end_of_week).completed.sum(:total_amount)
  end

  def last_weekly_sale_total
    sales.where(created_at: (DateTime.now.at_beginning_of_week - 1).at_beginning_of_week..(DateTime.now.at_beginning_of_week - 1)).completed.sum(:total_amount)
  end

  def weekly_goal_validate
    if weekly_sale_total > 473
      true
    else
      false
    end
  end

  def last_weekly_goal_validate
    if last_weekly_sale_total > 473
      true
    else
      false
    end
  end

end

class Message < ApplicationRecord

  #validates :name, :email, :phone, :title, :message, presence: true

  def message_readed
    if self.readed
      "Leido"
    else
      "Sin Leer"
    end
  end

end

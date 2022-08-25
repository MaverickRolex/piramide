class PaymentsController < ApplicationController

  def create
    @payment = Sale.new(payment_params)

  end

  def destroy
    @payment = Payment.find_by(id: params[:id])
    if @payment.destroy
      flash.now[:notice] = "Pago eliminado."
      redirect_to sale_path(@payment.sale.id)
    end
  end

  private

  def set_payments
    @payment = Payment.where(params[:sale_id])
  end

  def payment_params
    params.requsire(:payment).permit(:user_id, :sale_id, :amount)
  end

end

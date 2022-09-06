class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      if current_user.admin
        @payment.sale.provider_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
        if @payment.sale.user === @payment.user
          @payment.sale.total_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
        end
      else
        @payment.sale.total_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
      end
      @payment.sale.save
      flash.now[:notice] = "Pago Registrado."
      redirect_to sale_path(@payment.sale.id)
    else
      flash.now[:alert] = "No se pudo registrar el pago."
      redirect_to sale_path(@payment.sale.id)
    end

  end

  def destroy
    @payment = Payment.find_by(id: params[:id])
    if @payment.destroy
      if current_user.admin
        @payment.sale.provider_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
        if @payment.sale.user === @payment.user
          @payment.sale.total_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
        end
      else
        @payment.sale.total_balance = @payment.sale.total_amount - @payment.sale.sale_payments_total(current_user.id)
      end
      @payment.sale.save
      flash.now[:notice] = "Pago eliminado."
      redirect_to sale_path(@payment.sale.id)
    end
  end

  private

  def set_payments
    @payment = Payment.where(params[:sale_id])
  end

  def payment_params
    params.require(:payment).permit(:user_id, :sale_id, :amount)
  end

end

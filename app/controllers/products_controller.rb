class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(id: "asc")
  end

  def new
    @product = Product.new
  end

  def show
    
  end

  def edit

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Producto creado."
      redirect_to @product
    else
      flash[:alert] = "Error al crear el producto."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Los cambios han sido guardados."
      redirect_to @product
    else
      flash[:alert] = "Error al editar el producto."
      render :show
    end
  end 

  def destroy
    if current_user.admin
      if @product.destroy
        flash[:notice] = "Producto eliminado con exito."
        redirect_to action: "index"
      end
    else
      flash[:alert] = "No tiene permisos para eliminar productos, contacte al administrador."
      render :show
    end
  end

  def search
    if params[:search][:code].present?
      product = Product.find_by(code: params[:search][:code].upcase)
      if product.present? 
        redirect_to new_sale_path(product_id: product.id)
      else
        flash[:alert] = "No se encontro el producto"
        redirect_to new_sale_path
      end
    else
      flash[:alert] = "Ingrese Codigo"
      redirect_to new_sale_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:code, :name, :description, :ingredients, :price, :stock, :picture_name, :video_url)
  end
end

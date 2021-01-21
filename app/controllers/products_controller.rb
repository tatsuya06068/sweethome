class ProductsController < ApplicationController
  def index
    @q = Product.includes(:product_detail).ransack(params[:q])
    @materials = Material.all
    @products = @q.result
    # Product.includes([:product_details, materials_useds: :materias])
  end

  def Show; end

  private

  def search_params
    params.require(:q).permit(:material_id)
  end
end

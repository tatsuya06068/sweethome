class ProductsController < ApplicationController
  def index
    console
    @q = Product.ransack(params[:q])
    @materials = Material.all
    @products = @q.result.includes(:product_detail, materials: :materials_useds)
    # Product.includes([:product_details, materials_useds: :materias])
  end

  def Show
　 end

  private

  def search_params
    params.require(:q).permit(:materials_id)
  end
end

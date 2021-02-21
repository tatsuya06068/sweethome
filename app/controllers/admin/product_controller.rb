class Admin::ProductController < Admin::ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @materials = Material.all
    @categories = Category.all
    @products = @q.result.includes(:product_detail, :category, materials: :materials_useds)
  end

  def Show
    
  end

  def new
    
  end

  private
    def search_params
      params.require(:q).permit(:materials_id, :category_id)
    end
end

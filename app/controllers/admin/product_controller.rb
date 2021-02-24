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
    console
    @product = Product.new 
    @product.build_product_detail
    @product.materials_useds.build
    @materials = Material.all
    @category = Category.all
  end

  def create
    console
    @product = Product.new(product_params)
    @category = Category.all
    @materials = Material.all
    @product.save!
    redirect_to admin_product_index_path
    
  end

  private
    def search_params
      params.require(:q).permit(:materials_id, :category_id)
    end

    def product_params
      params.require(:product).permit(:name, :category_id, :displayfrom, :displayto, :image, product_detail_attributes: [:description], materials_useds_attributes: [:material_id])
    end
end

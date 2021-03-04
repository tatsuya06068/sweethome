class Admin::ProductController < Admin::ApplicationController
  def index
    console
    @q = Product.ransack(params[:q])
    @materials = Material.all
    @categories = Category.all
    @products = @q.result.includes(:category, materials: :materials_useds)
  end

  def Show
    
  end

  def new
    @product = Product.new 
    @product.build_product_detail
    @product.materials_useds.build
    @materials = Material.all
    @category = Category.all
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to admin_product_index_path, notice: "#{@product.name}を登録しました。"
    else
      @category = Category.all
      @materials = Material.all
      render :new
    end
  end

  private
    def search_params
      params.require(:q).permit(:materials_id, :category_id)
    end

    def product_params
      params.require(:product).permit(:name, :category_id, :displayfrom, :displayto, :image, product_detail_attributes: [:description], materials_useds_attributes: [:material_id])
    end
end

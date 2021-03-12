class Admin::ProductController < Admin::ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @materials = Material.all
    @categories = Category.all
    @taxes = Tax.all
    @products = @q.result.includes(:category, materials: :materials_useds)
  end

  def edit
    @materials = Material.all
    @taxes = Tax.all
    @category = Category.all
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.valid?
      MaterialsUsed.where(product_id: @product[:id]).delete_all
      @product.update!(product_params)
      redirect_to admin_product_index_path, notice: "#{@product.name}を更新しました。"
    else
      @category = Category.all
      @taxes = Tax.all
      @materials = Material.all
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new 
    @product.build_product_detail
    @product.materials_useds.build
    @materials = Material.all
    @taxes = Tax.all
    @category = Category.all
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      render :show, notice: "#{@product.name}を登録しました。"
    else
      @category = Category.all
      @materials = Material.all
      render :new
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_product_index_path, notice: "#{product.name}を削除しました。"
  end

  private
    def search_params
      params.require(:q).permit(:materials_id, :category_id)
    end

    def product_params
      params.require(:product).permit(:name, :category_id, :money, :tax_id, :displayfrom, :displayto, :image, product_detail_attributes: [:description], materials_useds_attributes: [:material_id])
    end
end

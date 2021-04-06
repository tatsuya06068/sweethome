class Admin::ProductController < Admin::ApplicationController
  before_action :get_tables, only: [:index, :edit, :update, :show, :new, :create]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:category, materials: :materials_useds)
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    verification =  Product.new(product_params)
    if verification.valid? 
      MaterialsUsed.where(product_id: @product[:id]).delete_all
      @product.update!(product_params)
      redirect_to admin_product_index_path, notice: "#{@product.name}を更新しました。"
    else
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
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      render :show, notice: "#{@product.name}を登録しました。"
    else
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

    def get_tables
      @categories = Category.all  
      @materials = Material.all    
      @taxes = Tax.all  
    end
end

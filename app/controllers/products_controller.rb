class ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%").page(params[:page])
    else
  	  @products = Product.order('products.created_at DESC').page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

    def showcategory
      @products = Product.where(category: params[:category])
    end

  def new
  	@product = Product.new
  end

  def create
    binding.pry
  	@product = Product.new(params_checked)
  	if @product.save
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to products_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def params_checked
  	params.require(:product).permit(:name, :description, :price_in_cents, :category)
  end
end

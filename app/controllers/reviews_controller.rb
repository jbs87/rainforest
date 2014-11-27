class ReviewsController < ApplicationController
  before_filter :load_product, :ensure_logged_in, only: [:create, :destroy]

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user
    @sreview = @review.save
    respond_to do |format|
     if @sreview
      format.html { redirect_to product_path(@product.id), notice: 'Review added.' }
      format.js {}
    else
      format.html { render 'products/show' }
      format.js {}
    end
  end
end

def destroy
 @review = Review.find(params[:id])
 @review.destroy
end

private
def review_params
 params.require(:review).permit(:comment, :product_id)
end

def load_product
 @product = Product.find(params[:product_id])
end
end

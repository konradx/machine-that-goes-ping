class ProductsController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]
before_action :authorize_user, :only => [:edit, :update, :destroy]
  expose(:category)
  expose(:products)
  expose(:product) 
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    if product.save
      category.products << product
      current_user.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end
  def update
    if product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(category), notice: 'Product was successfully destroyed.'
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end
    def authorize_user
      if product.user != current_user
         redirect_to category_product_url(category, product), :flash => {error: "You are not allowed to edit this product."}
      end
      
    end
end


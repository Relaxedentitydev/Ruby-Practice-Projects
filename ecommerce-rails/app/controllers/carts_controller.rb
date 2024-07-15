class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.build_cart
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add_product
  @product = Product.find(params[:product_id])
  @cart = current_user.cart || current_user.build_cart

  @cart_item = @cart.cart_items.find_or_initialize_by(product: @product)

  @cart_item.quantity ||= 0
  @cart_item.quantity += 1


    if @cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Unable to add product to cart.'
    end
  end

  def remove_product
    @product = Product.find(params[:product_id])
    @cart = current_user.cart
    @cart_item = @cart.cart_items.find_by(product: @product)

    if @cart_item&.destroy
      redirect_to cart_path, notice: 'Product removed from cart.'
    else
      redirect_to cart_path, alert: 'Unable to remove product from cart.'
    end
  end
  
  def empty_cart
    @cart = current_user.cart

    if @cart&.destroy
      redirect_to cart_path, notice: 'Cart emptied successfully.'
    else
      redirect_to cart_path, alert: 'Unable to empty cart.'
    end
  end
end

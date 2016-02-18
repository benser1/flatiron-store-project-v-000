class CartsController < ApplicationController

  def index
    #is the created index html correct?
  end

  def new 
  end

  def create
  end

  # def checkout
  #   @cart = current_user.current_cart
  #   redirect_to store_path if @cart.nil?
  #   @cart.checkout
  #   Cart.destroy(@cart.id)
  #   redirect_to cart_path(@cart)
  # end

  def show
    @cart = Cart.find(params[:id])
  end

end

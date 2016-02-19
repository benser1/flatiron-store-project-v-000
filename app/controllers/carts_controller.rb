class CartsController < ApplicationController

  def show
  end

  def checkout
    @cart = current_user.current_cart
    redirect_to store_path if @cart.nil?
    @cart.checkout
    Cart.destroy(@cart.id)
    redirect_to cart_path(@cart) 
  end

end #end

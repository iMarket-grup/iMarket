class CartController < ApplicationController
  before_action :authenticate_user!
  def index
   @categories=Category.all
   @carts = current_user.current_cart.posts
   @cart_sum = 0
   
    @carts.each do |cart|
      @cart_sum = @cart_sum + cart.cost.to_i
    end
    @coupons = Coupon.all


    name = params[:name]
    @name = name 

  end

end

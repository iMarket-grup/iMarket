class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
  end

  def new
    @coupon=Coupon.new
  end
  def create 
    @coupon = Coupon.new(coupon_params)
    if (@coupon.save)
      redirect_to coupons_path
    else
      render :new
    end
  end
  def add_coupon
    
  end
  def coupon_params
    params.require(:coupon).permit(:name)
 
   end
end

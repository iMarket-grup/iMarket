class PaymentsController < ApplicationController
  def index
    @carts = current_user.current_cart.posts
    @coupons = Coupon.all
    name = params[:name]
    @name = name
    @cart_sum = 0

    @carts.each do |cart|
      @cart_sum = @cart_sum + cart.cost.to_i
    end


    @coupons.each do |coupon|

        if  @name == coupon.name
 
            @cart_sum = @cart_sum - 100
        else
            @cart_sum
        end
    end

    @cardnumber = params[:cardnumber]
    @cvc = params[:cvc] # 123 olarak girileek
    @expireyear = params[:expireyear] #payments 2030 olarak girilecek
    @expiremonth = params[:expiremonth] # 12 olarak girilecek

    @options = Iyzipay::Options.new
    @options.api_key = 'sandbox-hmJRzKieaL2qHp1HR2jgBzXqt54dxkhC'
    @options.secret_key = 'sandbox-dgKexx2oXW6ERWqM8fbuFkbaBDzFD1T0'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: @cardnumber,
        expireYear: @expireyear,
        expireMonth: @expiremonth,
        cvc: @cvc,
        registerCard: 0
    }
    buyer = {
        id: 'BY789',
        name: 'John',
        surname: 'Doe',
        identityNumber: '74300864791',
        email: 'email@email.com',
        gsmNumber: '+905350000000',
        registrationDate: '2013-04-21 15:12:09',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        city: 'Istanbul',
        country: 'Turkey',
        zipCode: '34732',
        ip: '85.34.78.112'
    }
    address = {
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        zipCode: '34732',
        contactName: 'John Doe',
        city: 'Istanbul',
        country: 'Turkey'
    }

    item1 = {
        id: 'BI101',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '1.0'
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '1.0'
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: (@cart_sum-2).to_s
    }
    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        price: @cart_sum.to_s,
        paidPrice: '1.1',
        installment: 1,
        paymentChannel: Iyzipay::Model::PaymentChannel::WEB,
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::SUBSCRIPTION,
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card,
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    payment = Iyzipay::Model::Payment.new.create(request, @options)
    begin
        $stderr.puts payment.inspect
        
    rescue
        $stderr.puts 'oops'
        raise
    end
    status = payment.body.split(',')[0].split('"')[3]

    if status == "success"
        flash.alert = "Ödeme Başarılı"
    else
        flash.alert = "Ödeme Başarısız"
    end

  end

  def success
  end

  def fail
  end
end

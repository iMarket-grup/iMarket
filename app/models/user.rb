class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: {admin:0,user:1}
  has_many :carts
  def current_cart
    if carts.present?
      carts.last
    else
      carts.create
    end
  end
end

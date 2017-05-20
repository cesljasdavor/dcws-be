class PurchasesController < ApplicationController
  def bought
    user = User.find require_id
    if user.nil?
      render nothing: true, status: 400
    end

    render json: user.purchases
  end

  def sold
    user = User.find require_id
    if user.nil?
      render nothing: true, status: 400
    end

    render json: get_purchases(user)
  end

  def set_on_the_way
    purchase = Purchase.find require_id
    if purchase.nil?
      render nothing: true, status: 400
    end

    purchase.update(on_the_way: true);
    render json: purchase.updated_at
  end

  private
  # generičko vađenje id-a i za korisnika i za purchase
  def require_id
    params.permit(:id)[:id]
  end

  def get_purchases(user)
    purchases = []
    Product.where(email_seller: user.email).each do |product|
      purchases += product.purchases
    end

    return purchases
  end
end

class ReceiptsController < ApplicationController
  def buy
    purchases = extract_purchases
    total = calculate_total(purchases)

    @receipt = Receipt.create!(total: total)

    if @receipt.present?
      receipt_hash = {receipt_id: @receipt.id}
      purchases.each do |purchase_hash|
        #sada je u purchase_hash sve što nam je potrebno
        purchase_hash.merge!(receipt_hash)

        Purchase.create!(purchase_hash)
      end
    else
      render nothing: true, status: 400
    end
  end

  private
  def extract_purchases
    purchases = []
    params[:purchases].each do |purchase_param|
      purchases.append(purchase_param.to_unsafe_hash)
    end

    return purchases
  end

  def calculate_total(purchases)
    total = 0
    purchases.each do |purchase|
      total += purchase[:amount].to_i * purchase[:price].to_f
    end

    return total
  end
end

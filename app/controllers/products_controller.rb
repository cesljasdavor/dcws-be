class ProductsController < ApplicationController

  def all_products
    @products = Product.all

    render :all_products
  end

  def create_product
    @product = Product.create! product_params
    if @product.present?
      add_categories_to_product
      render :create_product
    else
      render nothing: true, status: 400
    end
  end

  def delete_product
    product = Product.find product_id
    if product.present?
      if product.destroy!
        render nothing: true, status: 200
      else
        render nothing: true, status: 400
      end
    else
      render nothing: true, status: 400
    end
  end

  def update_product
    @product = Product.find product_id
    if @product.present?
      if @product.update!(product_params)
        @product.product_categories.destroy_all
        add_categories_to_product
        render nothing: true, status: 200
      else
        render nothing: true, status: 400
      end
    else
      render nothing: true, status: 400
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

  def product_categories
    category_names = params.require(:categories)
    categories = []
    category_names.each do |name|
      categories << Category.find_by(name: name)
    end
    return categories
  end

  def product_params
    params.require(:product).permit(:title, :description, :availability, :price, :email_seller)
  end

  def product_id
    params.permit(:id_product)[:id_product]
  end

  def add_categories_to_product
    product_categories.each do |category|
      ProductCategory.create!(product_id: @product.id, category_id: category.id)
    end
  end

end

class CategoriesController < ApplicationController

  def get_categories
    render json: Category.all
  end

  def create_category
    @category = Category.create! category_params
    if @category.present?
      render :create_category
    else
      render nothing: true, status: 400
    end
  end

  def delete_category
    category = Category.find_by(name: category_name)
    if category.present?
      if category.destroy!
        render nothing: true, status: 200
      else
        render nothing: true, status: 400
      end
    else
      render nothing: true, status: 400
    end
  end

  def update_category
    category = Category.find_by(name: old_name)
    if category.present?
      if category.update!(new_value)
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

  def old_name
    params.require(:oldValue).permit(:name)[:name]
  end

  def new_value
    params.require(:newValue).permit(:name, :description)
  end

  def category_name
    params.require(:category).permit(:name)[:name]
  end
end

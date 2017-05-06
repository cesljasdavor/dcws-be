class UsersController < ApplicationController
  def login
    hashUserData = require_email_and_password
    @user = User.find_by email: hashUserData[:email]
    if @user.password === hashUserData[:password]
      if @user.update! active: true
        render :login
      else
        render nothing: true, status: 400
      end
    else
      render nothing: true, status: 400
    end
  end

  def logout
    userEmail = require_email
    user = User.find_by userEmail

    if user.update! active: false
      render :logout
    else
      render nothing: true, status: 400
    end
  end

  def register_buyer
    if User.find_by(email: require_email[:email]).nil?
      userHash = require_buyer
      @user = User.create!(userHash.merge({city_id: require_city_id, date_of_birth: require_date}))
      if @user.present?
        render :register, status: 200
      else
        render nothing: true, status: 400
      end

    else
      render nothing: true, status: 400
    end
  end

  def register_vendor
    if User.find_by(email: require_email[:email]).nil?
      userHash = require_vendor
      @user = User.create!(userHash.merge({city_id: require_city_id, date_of_birth: require_date}))
      if @user.present?
        render :register, status: 200
      else
        render nothing: true, status: 400
      end

    else
      render nothing: true, status: 400
    end
  end

  def edit_user_data
    user = User.find require_id
    updated_user = require_user
    if user.update!(
               name: updated_user[:name],
               surname: updated_user[:surname],
               telephone_number: updated_user[:telephone_number],
               address: updated_user[:address],
               city_id: require_city_id,
               date_of_birth: require_date
    )
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def edit_password
    user = User.find require_id
    if user.update! password: require_new_password
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def delete_buyer
    user = User.find require_id
    if user.destroy!
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def delete_vendor
    user = User.find require_id
    users_products = Product.where email_seller: user.email
    if user.destroy! and users_products.destroy_all
      render nothing: true, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def get_my_vendors
    user = User.find params[:id]
    @vendors = User.select(:id,:email,:name, :surname,:telephone_number,
                           :address,:privilege,:active, :city, :postal_code,
                           :date_of_birth)
                   .joins("INNER JOIN cities ON cities.id = users.city_id")
                   .where(email_admin: user[:email], privilege: 1)
    if @vendors.any?
      render json: @vendors, status: 200
    else
      render nothing: true, status: 400
    end
  end

  def get_buyers
    @buyers = User.select(:id,:email,:name, :surname,:telephone_number,
                          :address,:privilege,:active, :city, :postal_code,
                          :date_of_birth)
                  .joins("INNER JOIN cities ON cities.id = users.city_id")
                  .where(privilege: 0)
    if @buyers.any?
      render json: @buyers, status: 200
    else
      render nothing: true, status: 400
    end
  end

  private
  def require_email_and_password
    params.permit :email, :password
  end

  def require_email
    params.require(:user).permit(:email)
  end

  def require_user
    params.require(:user).permit(:name, :surname, :telephone_number, :address)
  end

  def require_id
    params.require(:user).permit(:id)[:id]
  end

  def require_new_password
    params.require(:user).permit(:password)[:password]
  end

  def require_buyer
    params.require(:user).permit(:email, :password, :name, :surname, :telephone_number, :address, :privilege)
  end

  def require_vendor
    params.require(:user).permit(:email,:email_admin, :password, :name, :surname, :telephone_number, :address, :privilege)
  end

  def require_city_id
    params.require(:city).permit(:id)[:id]
  end

  def require_date
    Date.parse(params.require(:user).permit(:date_of_birth)[:date_of_birth])
  end

end

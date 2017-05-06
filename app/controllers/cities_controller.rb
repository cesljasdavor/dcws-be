class CitiesController < ApplicationController
  def all_cities
    @cities = City.all

    render :all_cities
  end
end

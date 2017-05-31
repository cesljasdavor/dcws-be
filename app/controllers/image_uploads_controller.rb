class ImageUploadsController < ApplicationController

  def create
    image = Image.create(image: params[:file])
    render json: image
  end
end

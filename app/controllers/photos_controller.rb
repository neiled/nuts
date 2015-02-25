class PhotosController < ApplicationController

  def show
  end

  def create
    @photo = Photo.create( photo_params)
    redirect_to edit_talent_path(@photo.talent)
  end

  def new
    @talent = Talent.find(params[:talent_id])
    @photo = Photo.new
  end

  def destroy
    @talent = Talent.find(params[:talent_id])
    @photo = @talent.photos.find(params[:id])
    @photo.destroy
    redirect_to edit_talent_path(@talent)
  end

  private

  def photo_params
    params.require(:photo).permit(:image_file, :talent_id)
  end
end

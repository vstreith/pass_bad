class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    club = @photo.club

    @photo.destroy

    @photos = Photo.where(club_id: club.id)

    respond_to :js
  end
end

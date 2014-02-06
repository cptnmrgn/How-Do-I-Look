class LikesController < ApplicationController
  before_action :set_photo

  def create
    @like = @photo.likes.new(like_params)
    @like.user = current_user
    @like.save
    redirect_to user_photo_path(@photo.user, @photo)

  end

  def destroy
    @likes = current_user.likes.where(:photo_id => @photo.id)
      @likes.each do |like|
        like.destroy
      end
    redirect_to user_photo_path(@photo.user, @photo)
  end

  def update
  end



private
  def like_params
    params.require(:like).permit(:kind)
  end

  def set_photo
     @photo = Photo.find(params[:photo_id])
  end

end


class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_user


  # GET /photos
  # GET /photos.json
  def index
    if @user
      @photos = @user.photos.order(:created_at).reverse
    else
      @user = current_user
      @photos = Photo.order(:created_at).all.reverse
    end

  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    #@comment = @photo.comments.new
    @like = current_user.likes.where(:photo_id => @photo.id).first if current_user
    @photo.rating
    @photo.score
  end

  # GET /photos/new
  def new
    @photo = Photo.new

  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to user_photo_path(@user, @photo), notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to [@user, @photo], notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @user = @photo.user
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_path(@user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id)
    end
end

class GaleriesController < ApplicationController
  before_action :set_galery, only: %i[ show edit update destroy]

  def index
      @q= Galery.ransack(params[:q])
      @galeries = @q.result.includes(:tags,:taggings)
  end


  def show
  end 

  def new
    @galery = current_user.galeries.build
  end

  def edit
  end

  def create
    @galery = current_user.galeries.build(galery_params)
 

    respond_to do |format|
      if @galery.save

        format.html { redirect_to @galery, notice: "Gallery was Created Successfully." }
        format.json { render :show, status: :ok, location: @galery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @galery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
    if @galery.update(galery_params)


      format.html { redirect_to @galery, notice: "Gallery was updated Successfully." }
      format.json { render :show, status: :ok, location: @galery }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @galery.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
   
    @galery.destroy
    respond_to do |format|
      format.html { redirect_to galeries_url, notice: "Gallery was destroyed Successfully." }
      format.json { head :no_content }
    end
  end


    def delete_image_attachment
      @image = ActiveStorage::Blob.find_signed(params[:id])
      @image.attachments.first.purge
      redirect_back(fallback_location: root_path)
    end


  private
    
    def set_galery
      @galery = Galery.find(params[:id])
    end

    def galery_params
      params.require(:galery).permit(:gallery_title, :description, :email,:delete_image_attachment , :all_tag, :user_id,:published,images:[])
    end
end

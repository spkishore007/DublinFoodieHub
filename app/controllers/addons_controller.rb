class AddonsController < ApplicationController
  before_action :set_addon, only: [:show, :edit, :update, :destroy]

  # GET /addons
  # GET /addons.json
  def index
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    puts("methods are vvv" ,@store_detail.methods)
    @addons = @store_detail.addons
    
  end

  # GET /addons/1
  # GET /addons/1.json
  def show
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @addon = @store_detail.addons.find(params[:id])
  end

  # GET /addons/new
  def new
    
   @store_detail = StoreDetail.find(params[:store_detail_id])
     
     @addon = @store_detail.addons.build
  
  end

  # GET /addons/1/edit
  def edit
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @addon = @store_detail.addons.find(params[:id])
  end

  # POST /addons
  # POST /addons.json
  def create
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @addon = @store_detail.addons.build(params.require(:addon).permit(:addonName, :addonType, :addonSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  
   #   @addon = StoreDetail.find(params[:store_detail_id]).addonDetails.build(params.require(:addon).permit(:addonName, :addonType, :addonSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  

    respond_to do |format|
      if @addon.save
        format.html { redirect_to store_detail_addons_url, notice: 'addon detail was successfully created.' }
        format.json { render :show, status: :created, location: @addon }
      else
        format.html { render :new }
        format.json { render json: @addon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addons/1
  # PATCH/PUT /addons/1.json
  def update
     @store_detail = StoreDetail.find(params[:store_detail_id])
    @addon = Addon.find(params[:id])
    respond_to do |format|
      if @addon.update(addon_params)
        format.html { redirect_to store_detail_addon_url, notice: 'addon detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @addon }
      else
        format.html { render :edit }
        format.json { render json: @addon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addons/1
  # DELETE /addons/1.json
  def destroy
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @addon = Addon.find(params[:id])
     @addon.destroy
    respond_to do |format|
      format.html { redirect_to store_detail_addons_path(@store_detail), notice: 'addon detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addon
      @addon = Addon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addon_params
      params.require(:addon).permit(:addonName, :addonType, :addonSize, :actualPrice, :offerPrice, :quantityAvailable, :hit)
    end
end

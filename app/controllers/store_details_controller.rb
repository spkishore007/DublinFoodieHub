class StoreDetailsController < ApplicationController
  before_action :set_store_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, except: [:index]
  #before_action :authorize_store_owner!, only: [:edit, :update, :destroy]

  # GET /store_details
  # GET /store_details.json
  def index
    @store_details = StoreDetailPolicy::Scope.new(current_user, StoreDetail).resolve 
    #@store_details = StoreDetail.order(store_name: :asc)
    #authorize current_user, :index?
   authorize @store_details, :index?
  end

  # GET /store_details/1
  # GET /store_details/1.json
  def show
  # @store_details =StoreDetailPolicy.new(current_user, @store_detail).new?
   # @store_detail = StoreDetail.find(params[:id])
   authorize @store_detail, :show?
  end

  # GET /store_details/new
  def new
    @store_detail = StoreDetail.new
    #authorize @store_detail, :new?
  end

  # GET /store_details/1/edit
  def edit
   # StoreDetailPolicy.new(current_user,StoreDetail).edit? 
    authorize @store_detail, :edit?
  end

  # POST /store_details
  # POST /store_details.json
  def create
  
    @store_detail = StoreDetail.new(store_detail_params)
    @store_detail.member =current_member
    authorize @store_detail, :create?
    respond_to do |format|
      if @store_detail.save
        format.html { redirect_to @store_detail, notice: 'Store detail was successfully created.' }
        format.json { render :show, status: :created, location: @store_detail }
      else
        format.html { render :new }
        format.json { render json: @store_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_details/1
  # PATCH/PUT /store_details/1.json
  def update
    authorize @store_detail, :update?
    respond_to do |format|
      if @store_detail.update(store_detail_params)
        format.html { redirect_to @store_detail, notice: 'Store detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_detail }
      else
        format.html { render :edit }
        format.json { render json: @store_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_details/1
  # DELETE /store_details/1.json
  def destroy
    authorize @store_detail, :destroy?
    @store_detail.destroy
    respond_to do |format|
      format.html { redirect_to store_details_url, notice: 'Store detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_detail
      @store_detail = StoreDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_detail_params
      params.require(:store_detail).permit(:store_name, :building, :street, :city, :pincode, :store_mobile, :store_email)
    end
    
     # def authorize_store_owner!
      # authenticate_member!
      # unless @store_detail.member == current_user
      #  format.html { "You do not have enough permission to '#{action_name}' the '#{@store_detail.storeName.upcase}'"}
       # redirect_to store_details_path
      # end
     # end
end

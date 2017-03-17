class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    puts("methods are vvv" ,@store_detail.methods)
     @foods = @store_detail.foods
    
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @food = @store_detail.foods.find(params[:id])
  end

  # GET /foods/new
  def new
    
   @store_detail = StoreDetail.find(params[:store_detail_id])
     
     @food = @store_detail.foods.build
  
  end

  # GET /foods/1/edit
  def edit
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @food = @store_detail.foods.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @food = @store_detail.foods.build(params.require(:food).permit(:foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  
   #   @food = StoreDetail.find(params[:store_detail_id]).foodDetails.build(params.require(:food).permit(:foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  

    respond_to do |format|
      if @food.save
        format.html { redirect_to store_detail_foods_url, notice: 'Food detail was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
     @store_detail = StoreDetail.find(params[:store_detail_id])
 @food = Food.find(params[:id])
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to store_detail_food_url, notice: 'Food detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @food = Food.find(params[:id])
     @food.destroy
    respond_to do |format|
      format.html { redirect_to store_detail_foods_path(@store_detail), notice: 'Food detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit)
    end
end

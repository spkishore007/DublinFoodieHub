class ProductsController < ApplicationController
  def index
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @products = Product.all
    @order_item = current_order.order_items.new
 
  end
  def show
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.find(params[:id]) 
    @order_item = current_order.order_items.new
  end

  # GET /foods/new
  def new
    
   @store_detail = StoreDetail.find(params[:store_detail_id])
   @product = @store_detail.products.build
  
  end

  # GET /foods/1/edit
  def edit
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.find(params[:id])
  end

  # POST /foods
  # POST /foods.json
  def create
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.build(params.require(:product).permit(:name, :price, :active))  
   # @food = StoreDetail.find(params[:store_detail_id]).foodDetails.build(params.require(:food).permit(:foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  

    respond_to do |format|
      if @product.save
        format.html { redirect_to store_detail_products_url, notice: 'Food detail was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to store_detail_product_url, notice: 'Food detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
     @store_detail = StoreDetail.find(params[:store_detail_id])
     @product = Product.find(params[:id])
     @product.destroy
    respond_to do |format|
      format.html { redirect_to store_detail_products_path(@store_detail), notice: 'Food detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:price,:active)
    end
end

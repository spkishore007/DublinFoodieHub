require 'pizza_decorator'

class ProductsController < ApplicationController
  
  before_action :set_product, only: [:make_pizza,:reset_topping]
   
  def index
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @products = @store_detail.products.paginate(page: params[:page], per_page: 2)
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
    @product = @store_detail.products.build(params.require(:product).permit(:name, :price, :active, :description, :foodType, :foodSize, :offerPrice, :quantityAvailable, :allergens, :ingredients, :calorie,  :hit))  
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
  
  def make_pizza
     myPizza = SimplePizza.new(@product.price,@product.name,@product.allergens,@product.ingredients,@product.calorie)
     # add the extra features to the new car
     if params[:topping].to_s == "Mozarella" then
     myPizza = MozarellaDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Parmesan" then
     myPizza = ParmesanDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Pepperoni" then
     myPizza = PepperoniDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Capicollo" then
     myPizza = CapicolloDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Chipotle" then
     myPizza = ChipotleDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Pesto" then
     myPizza = PestoDecorator.new(myPizza)
     end
     if params[:topping].to_s == "Bruschetta" then
     myPizza = BruschettaDecorator.new(myPizza)
     end
     if params[:topping].to_s == "BBQ" then
     myPizza = BbqDecorator.new(myPizza)
     end
     ## populate the cost and the description details
     @product.tapping = Array.new unless @product.tapping.present?
     @product.tapping << myPizza
     @product.save
  end  

  def reset_topping
    @product.update_attributes(tapping: nil)
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :active, :description, :foodType, :foodSize, :offerPrice, :quantityAvailable, :allergens, :ingredients, :calorie,  :hit)
    end
end

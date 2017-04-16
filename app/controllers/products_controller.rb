require 'pizza_decorator'
require 'product_home_template'
require 'medical_strategy'
require 'pizza_app_logger'

class ProductsController < ApplicationController
  
  before_action :set_product, only: [:make_pizza,:reset_topping]
   
  def index
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @products =ProductPolicy::Scope.new(current_user, @store_detail.products).resolve.paginate(page: params[:page], per_page: 2)
    authorize @products, :index?
    @order_item = current_order.order_items.new
    basic = CheckByNormal.new(params[:store_detail_id])
    #@products = basic.with_page(params[:page])
    rank = CheckByRank.new(params[:store_detail_id])
    @record_products = rank.without_page(current_member)
    hit = CheckByHit.new(params[:store_detail_id])
    @product_by_hits = hit.with_page(params[:page])
    self.medical_page
    #self.price_change
  end
  
  def price_change
    order = OrderSend.new()
    result = Pricing.new(order)
    puts(result)
    order.notify_observers
    puts("Pricing is completed. =========================================== Now count update and hit update is going to perform")
  end
  
  def product_refresh_qty
    @refresh = ProductUpdateSingleton.instance
    @refresh_qty = @refresh.refresh_quantity
    puts(@refresh_qty)
  end
  
  def product_count_update
    @product_count = ProductUpdateSingleton.instance
    @count_up = @product_count.count_update
    puts(@count_up)
  end
  
  def medical_page
   @user_medical_check = current_member.profile
   if(current_member.profile)
    @medical_confirmation = Medical.find_by idProof: @user_medical_check.idProof
    if(@medical_confirmation)
      if (@medical_confirmation.medicalCondition == "high")
        @medical_high = MedicalCheck.new(MediHigh.new(@medical_confirmation))
        @customer_data = @medical_high.alltogether
      elsif (@medical_confirmation.medicalCondition == "medium")
        @medical_medium = MedicalCheck.new(MediMed.new(@medical_confirmation))
        @customer_data = @medical_medium.alltogether
      else
        @medical_low = MedicalCheck.new(MediLow.new(@medical_confirmation))
        @customer_data = @medical_low.alltogether
      end
    else
     @customer_data = "Sorry for the inconvience. We couldn't find your medical details to suggest."
    end
   else
     redirect_to new_profile_url
   end
  end
  
  def show
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.find(params[:id]) 
    authorize @product, :show?
    @order_item = current_order.order_items.new
    @click_update = current_member.clicks.new
    @click_update.product_identity = @product.id
    @click_update.save
  end

  # GET /foods/new
  def new
    
   @store_detail = StoreDetail.find(params[:store_detail_id])
   @product = @store_detail.products.build
   authorize @product, :new?
  end

  # GET /foods/1/edit
  def edit
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.find(params[:id])
    authorize @product, :edit?
  end

  # POST /foods
  # POST /foods.json
  def create
    
    @store_detail = StoreDetail.find(params[:store_detail_id])
    @product = @store_detail.products.build(params.require(:product).permit(:name, :price, :active, :description, :foodType, :foodSize, :offerPrice, :quantityAvailable, :allergens, :ingredients, :calorie,  :hit))
    authorize @product, :create?
   # @food = StoreDetail.find(params[:store_detail_id]).foodDetails.build(params.require(:food).permit(:foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit))  
    logger = MyLogger.instance
    logger.productInformation(@product.name)
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
     authorize @product, :update?
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
      authorize @product, :destroy?
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

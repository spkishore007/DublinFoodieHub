class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
     @food = Food.find(params[:food_id])
     puts("methods of index in food comments" ,@food.methods)
     @comments = @food.comments
    
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @food = Food.find(params[:food_id])
     @comment = @food.comments.find(params[:id])
    
  end

  # GET /comments/new
  def new
    @food = Food.find(params[:food_id])
     @comment = @food.comments.build
  end

  # GET /comments/1/edit
  def edit
    @food = Food.find(params[:food_id])
     @comment = @food.comments.find(params[:id])
    
  end

  # POST /comments
  # POST /comments.json
  def create
    @food = Food.find(params[:food_id])
     @comment = @food.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to food_comments_url, notice: 'Food comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @food = Food.find(params[:food_id])
     @comment = @food.comments.find(params[:id])
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to food_comment_url, notice: 'Food comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @food = Food.find(params[:food_id])
     @comment = @food.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to food_comments_url, notice: 'Food comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :rating)
    end
end

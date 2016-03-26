class NewcategoriesController < ApplicationController
  before_action :set_newcategory, only: [:show, :edit, :update, :destroy]

  # GET /newcategories
  # GET /newcategories.json
  def index
    @newcategories = Newcategory.all
  end

  # GET /newcategories/1
  # GET /newcategories/1.json
  def show
  end

  # GET /newcategories/new
  def new
    @newcategory = Newcategory.new
  end

  # GET /newcategories/1/edit
  def edit
  end

  # POST /newcategories
  # POST /newcategories.json
  def create
    @newcategory = Newcategory.new(newcategory_params)
    respond_to do |newcategoryat|
      if @newcategory.save
        newcategoryat.html { redirect_to @newcategory, notice: 'Newcategory was successfully created.' }
        newcategoryat.json { render :show, status: :created, location: @newcategory }
      else
        newcategoryat.html { render :new }
        newcategoryat.json { render json: @newcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newcategories/1
  # PATCH/PUT /newcategories/1.json
  def update
    respond_to do |newcategoryat|
      if @newcategory.update(newcategory_params)
        newcategoryat.html { redirect_to @newcategory, notice: 'Newcategory was successfully updated.' }
        newcategoryat.json { render :show, status: :ok, location: @newcategory }
      else
        newcategoryat.html { render :edit }
        newcategoryat.json { render json: @newcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newcategories/1
  # DELETE /newcategories/1.json
  def destroy
    @newcategory.destroy
    respond_to do |newcategoryat|
      newcategoryat.html { redirect_to newcategories_url, notice: 'Newcategory was successfully destroyed.' }
      newcategoryat.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newcategory
      @newcategory = Newcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newcategory_params
      params.require(:newcategory).permit(:new_category_name, :id)
    end
end

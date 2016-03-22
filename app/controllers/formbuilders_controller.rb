class FormbuildersController < ApplicationController
  before_action :set_formbuilder, only: [:show, :edit, :update, :destroy]

  # GET /formbuilders
  # GET /formbuilders.json
  def index
    @formbuilders = Formbuilder.all
  end

  # GET /formbuilders/1
  # GET /formbuilders/1.json
  def show
    # @formbuilder.formquestions.build
  end

  # GET /formbuilders/new
  def new
    @formbuilder = Formbuilder.new
  end

  # GET /formbuilders/1/edit
  def edit
  end

  # POST /formbuilders
  # POST /formbuilders.json
  def create
    @formbuilder = Formbuilder.new(formbuilder_params)

    respond_to do |format|
      if @formbuilder.save
        format.html { redirect_to @formbuilder, notice: 'Formbuilder was successfully created.' }
        format.json { render :show, status: :created, location: @formbuilder }
      else
        format.html { render :new }
        format.json { render json: @formbuilder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formbuilders/1
  # PATCH/PUT /formbuilders/1.json
  def update
    respond_to do |format|
      if @formbuilder.update(formbuilder_params)
        format.html { redirect_to @formbuilder, notice: 'Formbuilder was successfully updated.' }
        format.json { render :show, status: :ok, location: @formbuilder }
      else
        format.html { render :edit }
        format.json { render json: @formbuilder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formbuilders/1
  # DELETE /formbuilders/1.json
  def destroy
    @formbuilder.destroy
    respond_to do |format|
      format.html { redirect_to formbuilders_url, notice: 'Formbuilder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formbuilder
      @formbuilder = Formbuilder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formbuilder_params
      params.require(:formbuilder).permit(:category )
    end
end

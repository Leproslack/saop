class QbuildersController < ApplicationController
  before_action :set_qbuilder, only: [:show, :edit, :update, :destroy]

  # GET /qbuilders
  # GET /qbuilders.json
  def index
    @qbuilders = Qbuilder.all
  end

  # GET /qbuilders/1
  # GET /qbuilders/1.json
  def show
  end

  # GET /qbuilders/new
  def new
    @qbuilder = Qbuilder.new
  end

  # GET /qbuilders/1/edit
  def edit
  end

  # POST /qbuilders
  # POST /qbuilders.json
  def create
    @qbuilder = Qbuilder.new(qbuilder_params)

    respond_to do |format|
      if @qbuilder.save
        format.html { redirect_to @qbuilder, notice: 'Qbuilder was successfully created.' }
        format.json { render :show, status: :created, location: @qbuilder }
      else
        format.html { render :new }
        format.json { render json: @qbuilder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qbuilders/1
  # PATCH/PUT /qbuilders/1.json
  def update
    respond_to do |format|
      if @qbuilder.update(qbuilder_params)
        format.html { redirect_to @qbuilder, notice: 'Qbuilder was successfully updated.' }
        format.json { render :show, status: :ok, location: @qbuilder }
      else
        format.html { render :edit }
        format.json { render json: @qbuilder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qbuilders/1
  # DELETE /qbuilders/1.json
  def destroy
    @qbuilder.destroy
    respond_to do |format|
      format.html { redirect_to qbuilders_url, notice: 'Qbuilder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qbuilder
      @qbuilder = Qbuilder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qbuilder_params
      params.require(:qbuilder).permit(:name)
    end
end

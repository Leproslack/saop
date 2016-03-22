class FormquestionsController < ApplicationController
  before_action :set_formquestion, only: [:show, :edit, :update, :destroy]

  # GET /formquestions
  # GET /formquestions.json
  def index
    @formquestions = Formquestion.all
  end

  # GET /formquestions/1
  # GET /formquestions/1.json
  def show
  end

  # GET /formquestions/new
  def new
    @formquestion = Formquestion.new
  end

  # GET /formquestions/1/edit
  def edit
  end

  # POST /formquestions
  # POST /formquestions.json
  def create

    @formbuilder = Formbuilder.find(params[:formbuilder_id])
    @formbuilder.formquestions.create (formquestion_params)

    redirect_to @formbuilder
  end

  # PATCH/PUT /formquestions/1
  # PATCH/PUT /formquestions/1.json
  def update
    respond_to do |format|
      if @formquestion.update(formquestion_params)
        format.html { redirect_to @formquestion, notice: 'Formquestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @formquestion }
      else
        format.html { render :edit }
        format.json { render json: @formquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formquestions/1
  # DELETE /formquestions/1.json
  def destroy
    @formquestion.destroy
    respond_to do |format|
      format.html { redirect_to formquestions_url, notice: 'Formquestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formquestion
      @formquestion = Formquestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formquestion_params
      params.require(:formquestion).permit(:question_build, :formbuilder_id)
    end
end

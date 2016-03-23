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
    @form = Form.find(params[:form_id])
    @formquestion = @form.formquestions.create(formquestion_params)

    respond_to do |format|
      if @formquestion.save
        format.html { redirect_to @form, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @formquestion }
      else
        format.html { render :new }
        format.json { render json: @formquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formquestions/1
  # PATCH/PUT /formquestions/1.json
  def update
    #binding.pry
    respond_to do |format|
      if @formquestion.update(formquestion_params)
        format.html { redirect_to :back, notice: 'Question was successfully updated.' }
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
    @form = Form.find(params[:form_id])
    @formquestion = @form.formquestions.find(params[:id])
    @formquestion.destroy
    respond_to do |format|
      format.html { redirect_to form_path(@form), notice: 'Question was successfully destroyed.' }
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
      params.require(:formquestion).permit(:question_name, :form_id, :id)
    end
end

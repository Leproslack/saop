class FormquestionsController < ApplicationController
  before_action :set_formquestion, only: [:show, :destroy]

  def calculate_evaluating
    score_category = 0
      @form.formquestions.each do |cat|
            score_category += cat.evaluate_method
        end
    @form.update(score_category: score_category)
  end

  def update_evaluate_after_destroy
    evaluate_new = @form.score_category - @formquestion.evaluate_method
    @form.update(score_category: evaluate_new)
  end
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

  # POST /formquestions
  # POST /formquestions.json
  def create
    @form = Form.find(params[:form_id])
    @formquestion = @form.formquestions.create(formquestion_params)
    respond_to do |format|
      if @formquestion.save
        calculate_evaluating
        format.html { redirect_to @form, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @formquestion }
      else
        format.html { redirect_to @form, notice: 'Submit Evaluate method.' }
        format.json { render json: @formquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formquestions/1
  # DELETE /formquestions/1.json
  def destroy
    @form = Form.find(params[:form_id])
    @formquestion = @form.formquestions.find(params[:id])
    if @formquestion.destroy
      update_evaluate_after_destroy
      respond_to do |format|
        format.html { redirect_to form_path(@form), notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formquestion
      @formquestion = Formquestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formquestion_params
      params.require(:formquestion).permit(:question_name, :form_id,
                                      :evaluate_method, :score_category, :id)
    end
end

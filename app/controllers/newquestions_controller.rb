class NewquestionsController < ApplicationController
  before_action :set_newquestion, only: [:show, :destroy]

  def calculate_evaluating
    new_category_score = 0
      @newcategory.newquestions.each do |cat|
            new_category_score += cat.new_question_score
        end
    @newcategory.update(new_category_score: new_category_score)
  end

  def update_evaluate_after_destroy
    evaluate_new = @newcategory.new_category_score - @newquestion.new_question_score
    @newcategory.update(new_category_score: evaluate_new)
  end
  # GET /newquestions
  # GET /newquestions.json
  def index
    @newquestions = Newquestion.all
  end

  # GET /newquestions/1
  # GET /newquestions/1.json
  def show
  end

  # GET /newquestions/new
  def new
    @newquestion = Newquestion.new
  end

  # POST /newquestions
  # POST /newquestions.json
  def create
    @newcategory = Newcategory.find(params[:newcategory_id])
    @newquestion = @newcategory.newquestions.create(newquestion_params)
    respond_to do |newcategoryat|
      if @newquestion.save
        calculate_evaluating
        newcategoryat.html { redirect_to @newcategory, notice: 'Question was successfully created.' }
        newcategoryat.json { render :show, status: :created, location: @newquestion }
      else
        newcategoryat.html { redirect_to @newcategory, notice: 'Submit Evaluate method.' }
        newcategoryat.json { render json: @newquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newquestions/1
  # DELETE /newquestions/1.json
  def destroy
    @newcategory = Newcategory.find(params[:newcategory_id])
    @newquestion = @newcategory.newquestions.find(params[:id])
    if @newquestion.destroy
      update_evaluate_after_destroy
      respond_to do |newcategoryat|
        newcategoryat.html { redirect_to newcategory_path(@newcategory), notice: 'Question was successfully destroyed.' }
        newcategoryat.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newquestion
      @newquestion = Newquestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newquestion_params
      params.require(:newquestion).permit(:new_question_name, :newcategory_id,
                                      :new_question_score, :new_category_score, :id)
    end
end

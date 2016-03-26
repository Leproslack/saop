class NewquestionsController < ApplicationController
  before_action :set_newquestion, only: [:show, :destroy]

  # GET /newquestions
  def index
    @newquestions = Newquestion.all
  end

  # GET /newquestions/1
  def show
  end

  # GET /newquestions/new
  def new
    @newquestion = Newquestion.new
  end

  # POST /newquestions
  def create
    @newcategory = Newcategory.find(params[:newcategory_id])
    @newquestion = @newcategory.newquestions.create(newquestion_params)
    respond_to do |format|
      if @newquestion.save
        Newquestion.calculate_total_score_of_category(@newcategory)
        format.html { redirect_to @newcategory, notice: 'Question was successfully created.' }
      else
        format.html { redirect_to @newcategory, notice: 'Submit all forms before Save' }
      end
    end
  end

  # DELETE /newquestions/1
  def destroy
    @newcategory = Newcategory.find(params[:newcategory_id])
    @newquestion = @newcategory.newquestions.find(params[:id])
    if @newquestion.destroy
      Newquestion.update_total_score_of_category_after_destroy(@newcategory, @newquestion)
      respond_to do |format|
        format.html { redirect_to newcategory_path(@newcategory), notice: 'Question was successfully destroyed.' }
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

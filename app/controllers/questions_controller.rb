class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |newcategoryat|
      if @question.save
        newcategoryat.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        newcategoryat.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |newcategoryat|
      if @question.update(question_params)
        newcategoryat.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        newcategoryat.html { render :edit }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy!
    respond_to do |newcategoryat|
      newcategoryat.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      # params.fetch(:question, {})
      params.require(:question).permit(:content, :poll_id)
    end
end

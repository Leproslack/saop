class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def calculate_rate
    poll_rate = 0
    @poll.categories.each do |cat|
      category_rate = 0
      cat.questions.each do |quest|
          category_rate += quest.question_rate
          poll_rate += quest.question_rate
      end
      @poll.categories.where(category_name: cat.category_name).update(category_rate: category_rate)
      @poll.update(poll_rate: poll_rate)
    end
  end

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new

  def new
    @poll = Poll.new(name: "Poll#{Time.now.strftime("%Y%d%m%H%M%S")}")
    total_score = 0
    Newcategory.all.each do |cat|
      total_score += cat.new_category_score
      category = @poll.categories.new(category_name: cat.new_category_name, category_score: cat.new_category_score )
        cat.newquestions.each do |quest|
          question = category.questions.new(content: quest.new_question_name, question_score: quest.new_question_score)
        end
    end
    @poll.total_score = total_score
  end

  # GET /polls/1/edit
  def edit
    # binding.pry
  end

  # POST /polls
  # POST /polls.json

  def create
    @poll = Poll.new(poll_params)
      # binding.pry
    respond_to do |newcategoryat|
      if @poll.save
        calculate_rate
  #binding.pry
        newcategoryat.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        newcategoryat.json { render :show, status: :created, location: @poll }
      else
        newcategoryat.html { render :new }
        newcategoryat.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |newcategoryat|
      if @poll.update(poll_params)
        calculate_rate
        newcategoryat.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        newcategoryat.json { render :show, status: :ok, location: @poll }
      else
        newcategoryat.html { render :edit }
        newcategoryat.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |newcategoryat|
      newcategoryat.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      newcategoryat.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name, :total_score,
          categories_attributes: [ :category_name, :category_score, :id,
                    questions_attributes: [:content, :id, :question_rate, :question_comment, :question_score]])
    end

end

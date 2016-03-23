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
    Form.all.each do |cat|
      category = @poll.categories.new(category_name: cat.name)
        cat.formquestions.each do |quest|
          question = category.questions.new(content: quest.question_name)
          # question.answers.new(answer_rate: nil, answer_comment: nil)
        end
    end
  end

  # GET /polls/1/edit
  def edit
    @test = Question.where(category: "Pos checklist", id: @poll)
  end

  # POST /polls
  # POST /polls.json

  def create
    @poll = Poll.new(poll_params)
      # binding.pry
    respond_to do |format|
      if @poll.save
        calculate_rate
        # poll_rate = 0
        # @poll.categories.each do |cat|
        #   category_rate = 0
        #   cat.questions.each do |quest|
        #       category_rate += quest.question_rate
        #       poll_rate += quest.question_rate
        #   end
        #   @poll.categories.where(category_name: cat.category_name).update(category_rate: category_rate)
        #   @poll.update(poll_rate: poll_rate)
        # end
  #binding.pry
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        calculate_rate
        # poll_rate = 0
        # @poll.categories.each do |cat|
        #   category_rate = 0
        #   cat.questions.each do |quest|
        #       category_rate += quest.question_rate
        #       poll_rate += quest.question_rate
        #   end
        #   @poll.categories.where(category_name: cat.category_name).update(category_rate: category_rate)
        #   @poll.update(poll_rate: poll_rate)
        # end
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name, :pos_rate,
          categories_attributes: [ :category_name, :id,
                    questions_attributes: [:content, :id, :question_rate, :question_comment]])
    end

end

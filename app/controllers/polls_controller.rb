class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /polls
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  def show
  end

  # GET /polls/new

  def new
    @poll = Poll.new
    Poll.get_attributes_from_template(@poll)
  end

  # GET /polls/1/edit
  def edit
    # binding.pry
  end

  # POST /polls
  def create
    @poll = Poll.new(poll_params)
      # binding.pry
    respond_to do |format|
      if @poll.save
        Poll.calculate_rate(@poll)
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /polls/1
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        Poll.calculate_rate(@poll)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
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
